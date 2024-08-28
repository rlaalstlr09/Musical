
package com.human.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.dto.AuthoritiesDto;
import com.human.dto.CustomerDto;
import com.human.service.IAuthoritiesService;
import com.human.service.ICustomerService;

@Controller
public class CustomerController {

	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private IAuthoritiesService authoritiesService;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
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
	public String searchId(HttpServletRequest request, Model model, CustomerDto dto, @RequestParam("customer_email") String customer_email) throws Exception{
		try {
			dto.setCustomer_email(customer_email);
			CustomerDto customer_id = customerService.findCustomerId(customer_email);
			model.addAttribute("findId",customer_id);
		} catch(Exception e) {
			model.addAttribute("msg", "오류가 발생되었습니다.");
			e.printStackTrace();
		}
		return "customer/findIdResult";
	}
	
	@RequestMapping(value = "/customer/findPwCheck", method = RequestMethod.POST)
	public String searchPw(HttpServletRequest request, Model model, CustomerDto dto, @RequestParam("customer_id") String customer_id, @RequestParam("customer_email") String customer_email) throws Exception{
		System.out.println("try실행 오류");
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","오류가 발생되었습니다.");
			return "customer/search_pw";
		}
		return "customer/findPwResult";
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
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}