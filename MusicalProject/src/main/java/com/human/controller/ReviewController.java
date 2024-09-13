package com.human.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.human.dto.*;
import com.human.service.ActorCharacterServiceImpl;
import com.human.service.ActorServiceImpl;
import com.human.service.CharacterServiceImpl;

import com.human.service.ReviewServiceImpl;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	@Autowired
	ReviewServiceImpl rService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	
	
	@RequestMapping(value = "/updateReview", method = RequestMethod.GET)
	public String updateReview()throws Exception{
		
		return "review/updateReview";
	}
	
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateRevieww(ReviewDto dto)throws Exception{
		
		rService.update(dto);
		
		
		return "redirect:/review/myReview";
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(Integer musical_id, ReviewDto dto, Model model,Authentication authentication)throws Exception{
		dto.setCustomer_id(authentication.getName());
		rService.insert(dto);
		System.out.println(dto);
		model.addAttribute("musical_id", musical_id);
		return "redirect:/tab/review";
	}
	
	
	

}
