
package com.human.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
//import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.dto.AuthoritiesDto;
import com.human.dto.CustomerDto;
import com.human.service.IAuthoritiesService;
import com.human.service.ICustomerService;
import com.human.service.MailService;

// 로그인 관련 작업 처리 컨트롤러
@Controller
public class CustomerController {

	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private IAuthoritiesService authoritiesService;
	@Autowired
	private MailService mailService;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@RequestMapping(value = "customer/sendMail.do", method = RequestMethod.POST)
	public String sendSimpleMail(CustomerDto dto,HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{
		System.out.println("메일 발송 준비완");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		 
		//PrintWriter out = response.getWriter();
		mailService.sendMail(dto.getCustomer_email(),"인증 코드입니다.","이메일 인증 코드입니다.");
		System.out.print("메일 전송 완료");
		return "customer/search_id";
	}
	
	
	@RequestMapping(value = "customer/insert", method = RequestMethod.POST)
	public String insert(AuthoritiesDto dtos,CustomerDto dto, RedirectAttributes rttr, Model model) throws Exception{
		try {
			System.out.println("insert 시작:"+dto);
			
			String encPassword = passwordEncoder.encode(dto.getCustomer_pw());

			dto.setCustomer_pw(encPassword);
			
			customerService.insert(dto);
			authoritiesService.insert(dtos);
			
			rttr.addFlashAttribute("msg","success");
			return "redirect:/customer/login";
		} catch(Exception e) {
			e.printStackTrace();
			return "customer/error";
		}
	}
	
	@RequestMapping(value = "/customer/findIdCheck", method = RequestMethod.POST)
	public String searchId(@RequestParam("auth_code") String auth_code, HttpSession session,HttpServletRequest request, Model model, CustomerDto dto, @RequestParam("customer_email") String customer_email) throws Exception{
		try {
			String code = (String) session.getAttribute("authCode");
			System.out.println("auth_code:"+auth_code);
			System.out.println("code:"+code);
			boolean isMatch = auth_code.equals(String.valueOf(code));
			
			if(isMatch) {
				System.out.println("인증 완료");
				request.setAttribute("msg", "인증 성공");
				dto.setCustomer_email(customer_email);
				List<CustomerDto> customer_id = customerService.findCustomerId(customer_email);
				model.addAttribute("findId",customer_id);
				return "customer/findIdResult";
			}	
		} catch(Exception e) {
			model.addAttribute("msg", "오류가 발생되었습니다.");
			e.printStackTrace();
		}
		return "customer/search_id";
	}
	
	@RequestMapping(value = "/customer/findPwCheck", method = RequestMethod.POST)
	public String searchPw(@RequestParam("auth_code") String auth_code, HttpSession session,HttpServletRequest request, Model model, CustomerDto dto, @RequestParam("customer_id") String customer_id, @RequestParam("customer_email") String customer_email) throws Exception{
		System.out.println("try실행 오류");
		try {
			String code = (String) session.getAttribute("authCode");
			System.out.println("auth_code:"+auth_code);
			System.out.println("code:"+code);
			boolean isMatch = auth_code.equals(String.valueOf(code));
			
			if(isMatch) {
				dto.setCustomer_id(customer_id);
				dto.setCustomer_email(customer_email);
				int search = customerService.pwCheck(dto);
				System.out.println("유효성 검사 시작");
				if(search == 0) {
					System.out.println("정보 오류");
					model.addAttribute("msg","기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
					return "customer/search_pw";
				}
					System.out.println("정상 작동");
					String newPw = RandomStringUtils.randomAlphanumeric(10);
					dto.setCustomer_pw(newPw);
					customerService.newPwUpdate(dto);
					model.addAttribute("newPwd",newPw);
					return "customer/findPwResult";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","오류가 발생되었습니다.");
			return "customer/search_pw";
		}
		return "customer/search_pw";
	}
	
	@RequestMapping(value = "customer/CheckId", method = RequestMethod.POST)
	public ResponseEntity<Boolean> CheckId(String customer_id) throws Exception{
		System.out.println("CheckId");
		System.out.println("customer_id : " + customer_id);
		boolean result = true;
		if(customer_id.trim().isEmpty()) {
			System.out.println("customer_id : " + customer_id);
			result = false;
		}else {
			if(customerService.selectId(customer_id)) {
				result = false;
			}else {
				result = true;
			}
		}
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
}