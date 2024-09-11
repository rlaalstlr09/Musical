package com.human.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.service.IMusicalService;
import com.human.service.ISeatService;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private IMusicalService musicalService;
	@Autowired
	private ISeatService seatService;
	
	  @RequestMapping("/")
	    public String Main(Model model) throws Exception {

	        return "home";  // JSP 뷰 이름
	    }
	  
	 
}



