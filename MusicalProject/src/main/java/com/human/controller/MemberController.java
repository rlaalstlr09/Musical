
package com.human.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.human.dto.QaDto;
import com.human.service.IAuthoritiesService;
import com.human.service.ICustomerService;
import com.human.service.IQaService;
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

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "member/update", method = RequestMethod.POST)
	public String updateDB(CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		System.out.println("update: "+dto);
		customerService.update(dto);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/myPage";
	}
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("customer_id") String customer_id, @RequestParam("customer_birth") String customer_birth)throws Exception{
		System.out.println("update");
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
		model.addAttribute(customerService.selectName(customer_id));
		return "member/uRead";
	}
	
	
	@RequestMapping(value = "member/delete", method = RequestMethod.GET)
	public String delete(AuthoritiesDto dtos,CustomerDto dto, HttpServletRequest request,@RequestParam("customer_id") String customer_id,RedirectAttributes rttr, Model model, HttpSession session) throws Exception{
		System.out.println("delete: "+dto);
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
		return "redirect:/home";
	}
	
	@RequestMapping(value = "member/nowPwCheck", method = RequestMethod.GET)
	public String nowPwCheck(@RequestParam("customer_id") String customer_id, Model model) throws Exception {
		System.out.println("nowPwCheck");
		System.out.println("customer_id:" + customer_id);
		model.addAttribute("customerDto",customerService.selectName(customer_id));
		return "member/nowPwCheck";
	}
	
	@RequestMapping(value = "member/nowPwCheck", method = RequestMethod.POST)
	public String nowPwCheckDB(@RequestParam("customer_id") String customer_id,@RequestParam("customer_pw") String customer_pw, Model model, CustomerDto dto,RedirectAttributes rttr) throws Exception{
		dto = customerService.nowPwCheck(customer_id);
		System.out.println("nowPwCheckDB");
		if(passwordEncoder.matches(customer_pw, dto.getCustomer_pw())) {
			return "redirect:pwUpdate?customer_id="+customer_id;
		} else {
            rttr.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/nowPwCheck?customer_id="+customer_id; 
		}
		
	}
	
	@RequestMapping(value = "member/pwUpdate", method = RequestMethod.POST)
	public String pwUpdateDB(CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		System.out.println("pwUpdate: "+dto);
		String encPassword = passwordEncoder.encode(dto.getCustomer_pw());
		dto.setCustomer_pw(encPassword);
		customerService.pwUpdate(dto);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/ok";
	}
	
	@RequestMapping(value = "member/pwUpdate", method = RequestMethod.GET)
	public String pwUpdate(@RequestParam("customer_id") String customer_id,CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		System.out.println("pwUpdate");
		model.addAttribute(customerService.selectName(customer_id));
		return "member/pwUpdate";
	}
	
	@RequestMapping(value = "member/read", method = RequestMethod.GET)
	public void read(Model model,@RequestParam("customer_id") String customer_id) throws Exception{
		System.out.println("read");
		System.out.println("customer_id:" + customer_id);
		model.addAttribute("customerDto",customerService.selectName(customer_id));
	}
	
	@RequestMapping(value = "member/uRead", method = RequestMethod.POST)
	public void uRead(Model model,@RequestParam("customer_id") String customer_id) throws Exception{
		System.out.println("uRead");
		System.out.println("customer_id:" + customer_id);
		model.addAttribute("customerDto",customerService.selectName(customer_id));
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
	public String qa_list(@RequestParam("customer_id") String customer_id,BoardVo vo, Model model) throws Exception{
		
		List<QaDto> List = qaService.qa_list(vo, customer_id);
		model.addAttribute("list",List);
		vo.setTotalCount(qaService.qa_listCount(customer_id));
		return "/qna/qa_list";
	}
}