package com.musical.ex;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.musical.dto.Musical_scheduleDto;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpSession session) throws Exception {
		System.out.println("home");
		return "home";			
	}
	
	
	
    @RequestMapping(value = "/count", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public String select_date(@RequestParam("date") String date) throws Exception {
        System.out.println("Fetching schedule for date: " + date);
        return date;
    }
    
    
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model,HttpSession session) throws Exception {
		System.out.println("login");
		session.setAttribute("id", "admin");
		System.out.println("id="+ session.getAttribute("id"));
		return "redirect:/";			
	}
    
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpSession session) throws Exception {
		System.out.println("logout");
		session.invalidate();
		return "redirect:/";	
	}
}
