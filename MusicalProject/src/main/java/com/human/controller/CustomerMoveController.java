package com.human.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CustomerMoveController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "/customer/customer";
	}
//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		return "/home";
//	}
	@RequestMapping(value = "/customer/error", method = RequestMethod.GET)
	public String customerError(Locale locale, Model model) {
		return "/customer/error";
	}
	@RequestMapping(value = "/customer/login", method = RequestMethod.GET)
	public String customerLogin(Locale locale, Model model) {
		return "/customer/login";
	}
	@RequestMapping(value = "/customer/signup" , method = RequestMethod.GET)
	public String customerSignup(Locale locale, Model model) {
		return "/customer/signup";
	}
	@RequestMapping(value = "/member/myPage" , method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		return "/member/myPage";
	}
	@RequestMapping(value = "/admin/admin" , method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		return "redirect:/admin/admin_main";
	}
	@RequestMapping(value = "/member/ok", method = RequestMethod.GET)
	public String pwOk(Locale locale, Model model) {
		return "/member/ok";
	}
	@RequestMapping(value = "/customer/search_id", method = RequestMethod.GET)
	public String search_id(Locale locale, Model model) {
		return "/customer/search_id";
	}
	@RequestMapping(value = "/customer/search_pw", method = RequestMethod.GET)
	public String search_pw(Locale locale, Model model) {
		return "/customer/search_pw";
	}
	@RequestMapping(value = "/customer/joinUs", method = RequestMethod.GET)
	public String joinUs(Locale locale, Model model) {
		return "/customer/joinUs";
	}
	@RequestMapping(value = "/member/removeMove", method = RequestMethod.GET)
	public String remove(Locale locale, Model model) {
		return "/member/remove";
	}
	@RequestMapping(value = "/member/pwUpdateMove", method = RequestMethod.GET)
	public String pwUpdateMove(Locale locale, Model model) {
		return "/member/pwUpdate";
	}
}
