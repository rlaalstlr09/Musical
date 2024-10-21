
package com.human.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.dto.AuthoritiesDto;
import com.human.dto.CustomerDto;
import com.human.dto.MusicalDto;
import com.human.dto.QaDto;
import com.human.dto.ReviewDto;
import com.human.service.IAuthoritiesService;
import com.human.service.ICustomerService;
import com.human.service.IMusicalService;
import com.human.service.IQaService;
import com.human.service.IReviewService;

import com.human.vo.BoardVo;

// 회원 관련 컨트롤러
@Controller
public class MemberController {

	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private IAuthoritiesService authoritiesService;
	@Autowired
	private IQaService qaService;
	@Autowired
	private IReviewService rService;
	@Autowired
	private IMusicalService musicalService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "member/update", method = RequestMethod.POST)
	public String updateDB(CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		System.out.println("update: "+dto);
		customerService.update(dto);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/myPage";
	}
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String update(Model model, Authentication authentication,HttpSession session,@RequestParam("customer_birth")String customer_birth)throws Exception{
		String customer_id = authentication.getName();
		System.out.println("update");
		
		model.addAttribute(customerService.selectName(customer_id));
		Boolean isVerified = (Boolean) session.getAttribute("pwCheck");
		if(isVerified != null && isVerified) {
			return "member/uRead";
		}else {
			session.setAttribute("customer_birth", customer_birth);
			System.out.println(session.getAttribute("customer_birth"));
			session.setAttribute("redirectUrl", "/member/uRead");
			session.setAttribute("url", "update");
			return "redirect:/member/nowPwCheck";
		}

	}
	
	@RequestMapping(value = "member/remove", method = RequestMethod.GET)
	public String remove(HttpSession session) throws Exception{
		Boolean isVerified = (Boolean) session.getAttribute("pwCheck");
		if(isVerified != null && isVerified) {
			return "member/remove";
		}else {
			session.setAttribute("redirectUrl", "/member/removeMove");
			return "redirect:/member/nowPwCheck";
		}
		
	}
	@RequestMapping(value = "member/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("customer_id") String customer_id,AuthoritiesDto dtos,CustomerDto dto, HttpServletRequest request,Authentication authentication,RedirectAttributes rttr, Model model, HttpSession session) throws Exception{
		
		System.out.println("customer_id:"+customer_id);
		System.out.println("dto: "+dto);
		System.out.println("dtos: "+dtos);
		qaService.deleteAll(dto);
		authoritiesService.delete(dtos);
		customerService.delete(dto);
		session.removeAttribute(customer_id);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null) {
			System.out.println("로그아웃");
			new SecurityContextLogoutHandler().logout(request, null, auth);
		}
		rttr.addFlashAttribute("msg","success");
		return "redirect:member/myPage";
	}
	
	@RequestMapping(value = "member/nowPwCheck", method = RequestMethod.GET)
	public String nowPwCheck(Authentication authentication, Model model, HttpSession session,HttpServletRequest request) throws Exception {
		String customer_id = authentication.getName();
		System.out.println("nowPwCheck");
		System.out.println("customer_id:" + customer_id);
		
		model.addAttribute("customerDto",customerService.selectName(customer_id));
		System.out.println(customerService.selectName(customer_id));
		
		return "member/nowPwCheck";
	}
	
	@RequestMapping(value = "member/nowPwCheck", method = RequestMethod.POST)
	public String nowPwCheckDB(Authentication authentication,@RequestParam("customer_pw") String customer_pw, Model model, CustomerDto dto,RedirectAttributes rttr,HttpSession session) throws Exception{
		String customer_id = authentication.getName();
		dto = customerService.nowPwCheck(customer_id);
		
		System.out.println("nowPwCheckDB");
		if(passwordEncoder.matches(customer_pw, dto.getCustomer_pw())) {
			session.setAttribute("pwCheck", true);
			String redirectUrl = (String) session.getAttribute("redirectUrl");
			String url = (String) session.getAttribute("url");
			System.out.println("redirectUrl:"+redirectUrl);
			if(redirectUrl != null) {
				session.removeAttribute("pwCheck");
				if(url != null && url.equals("update")) {
					System.out.println("dd");
					session.removeAttribute("url");
					return "redirect:"+redirectUrl;
				}else {
					return "redirect:"+redirectUrl;
				}
			}else {
				return "redirect:/member/myPage";
			}
		} else {
            rttr.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/nowPwCheck"; 
		}
	}
	
	@RequestMapping(value = "member/pwUpdate", method = RequestMethod.POST)
	public String pwUpdateDB(Authentication authentication, CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		String customer_id = authentication.getName();
		dto.setCustomer_id(customer_id);
		System.out.println("pwUpdate: "+dto);
		String encPassword = passwordEncoder.encode(dto.getCustomer_pw());
		dto.setCustomer_pw(encPassword);
		customerService.pwUpdate(dto);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/myPage";
	}
	
	@RequestMapping(value = "member/pwUpdate", method = RequestMethod.GET)
	public String pwUpdate(Authentication authentication,CustomerDto dto, RedirectAttributes rttr, Model model,HttpSession session) throws Exception{
		String customer_id = authentication.getName();
		System.out.println("pwUpdate");
		model.addAttribute(customerService.selectName(customer_id));
		Boolean isVerified = (Boolean) session.getAttribute("pwCheck");
		if(isVerified != null && isVerified) {
			return "member/pwUpdate";
		}else {
			session.setAttribute("redirectUrl", "/member/pwUpdateMove");
			return "redirect:/member/nowPwCheck";
		}
		
	}
	
	@RequestMapping(value = "member/read", method = RequestMethod.GET)
	public void read(Model model, Authentication authentication, HttpSession session) throws Exception{
		String customer_id = authentication.getName();
		System.out.println("read");
		System.out.println("customer_id:" + customer_id);
		String requestURI = "read";
		session.setAttribute("requestURI",requestURI);
		model.addAttribute("customerDto",customerService.selectName(customer_id));
	}
	
	@RequestMapping(value = "member/uRead", method = RequestMethod.GET)
	public void uRead(Model model, Authentication authentication,HttpSession session) throws Exception{
		String customer_id = authentication.getName();
		System.out.println("uRead");
		System.out.println("customer_id:" + customer_id);
		String customer_birth = (String) session.getAttribute("customer_birth");
		System.out.println("customer_birth:"+customer_birth);
		SimpleDateFormat Isdf = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy",Locale.US);
		SimpleDateFormat Osdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = Isdf.parse(customer_birth);
		} catch(ParseException e) {
			System.out.println("date parsing error:" + e.getMessage());
			date = new Date();
		}
		String formattedDate = Osdf.format(date);
		System.out.println(formattedDate);
		model.addAttribute("formattedDate",formattedDate);
		model.addAttribute("customerDto",customerService.selectName(customer_id));
	}
	// 장바구니
	@RequestMapping(value = "member/cart", method = RequestMethod.GET)
	public String selectCart(Authentication authentication,Model model) throws Exception{
		String customer_id = authentication.getName();
		List<MusicalDto> List = customerService.selectMusicalsLike(customer_id);
		model.addAttribute("list",List);
		return "member/cart";
	}
	@RequestMapping(value = "member/cartDelete", method = RequestMethod.GET)
	public String deleteCart(Authentication authentication,Model model,@RequestParam("musical_id") Integer musical_id,RedirectAttributes rttr) throws Exception{
		String customer_id = authentication.getName();
		musicalService.deleteLike(musical_id, customer_id);
		rttr.addFlashAttribute("msg","장바구니에서 해당 뮤지컬이 삭제되었습니다.");
		return "redirect:/member/cart";
	}
	
	// qna관련 메서드
	@RequestMapping(value = "member/write", method = RequestMethod.GET)
	public void writeGet() throws Exception {
	
	}
	@RequestMapping(value = "member/write", method = RequestMethod.POST)
	public String writePost(QaDto board,RedirectAttributes rttr) throws Exception {
		qaService.write(board);
		//rttr.addAttribute("msg","success");
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/myPage";		
	}
	
	@RequestMapping(value = "member/qa_list", method = RequestMethod.GET)
	public String qa_list(Authentication authentication,BoardVo vo, Model model) throws Exception{
		String customer_id = authentication.getName();
		List<QaDto> List = qaService.qa_list(vo, customer_id);
		model.addAttribute("list",List);
		vo.setTotalCount(qaService.qa_listCount(customer_id));
		return "/member/qa_list";
	}
	
	/////////////////////////////
	@RequestMapping(value = "member/myReview", method = RequestMethod.GET)
	public String myReview(Model model,Authentication authentication,@RequestParam(value="page",defaultValue="1") int page,
		@RequestParam(value="perPageNum",defaultValue="10") int perPageNum)throws Exception{
		String customer_id = authentication.getName();
		System.out.println(customer_id);
		BoardVo vo=new BoardVo();
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		vo.setTotalCount(rService.myTotalCount(customer_id));
		
		ArrayList<ReviewDto>dto=rService.selectMyReview(customer_id,vo);
		System.out.println(dto);
		model.addAttribute("List",dto);
		model.addAttribute("boardVo",vo);
		return "/member/myReview";
	}
	@RequestMapping(value = "member/updateReview", method = RequestMethod.GET)
	public String updateRevieww(ReviewDto dto)throws Exception{
		
		rService.update(dto);
		return "redirect:/member/myReview?customer_id="+dto.getCustomer_id();
	}
	@RequestMapping(value = "member/deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("review_id") int review_id, @RequestParam("customer_id") String customer_id)throws Exception{
		
		rService.delete(review_id);
		
		return "redirect:/member/myReview?customer_id="+customer_id;
	}
	@RequestMapping(value = "member/all_delete", method = RequestMethod.GET)
	public String all_delete(@RequestParam("customer_id") String customer_id)throws Exception{
		
		rService.all_delete(customer_id);
		
		return "redirect:/member/myReview?customer_id="+customer_id;
	}
	/////////////////////////////
	@RequestMapping("member/myQna")
	public String myQna(Model model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,Authentication authentication
			) throws Exception {
		String customer_id="";
		if(authentication != null) {
		customer_id=authentication.getName();
		}
		
		BoardVo vo = new BoardVo();
		
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		vo.setTotalCount(qaService.myTotalCount(customer_id));
		
		
		
		
		ArrayList<QaDto> dto = qaService.selectMyQna(customer_id,vo);		
		model.addAttribute("customer_id",customer_id);
		model.addAttribute("List", dto);		
		model.addAttribute("boardVo", vo);		
		
		
		return "member/myQna";

	}
	@RequestMapping(value = "/member/updateQna", method = RequestMethod.GET)
	public String updateQna(QaDto dto)throws Exception{
		
		qaService.updateQna(dto);
		
		
		return "redirect:/member/myQna";
	}
	@RequestMapping(value = "/member/deleteQna", method = RequestMethod.GET)
	public String deleteQna(@RequestParam("qa_id") int qa_id)throws Exception{
		
		qaService.deleteQna(qa_id);
		
		return "redirect:/member/myQna";
	}
	@RequestMapping(value = "/member/all_deleteQna", method = RequestMethod.GET)
	public String all_deleteQna(@RequestParam("customer_id") String customer_id)throws Exception{
		
		qaService.all_delete(customer_id);
		
		return "redirect:/member/myQna";
	}
}