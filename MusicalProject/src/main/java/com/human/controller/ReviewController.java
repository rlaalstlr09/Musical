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
public class ReviewController {
	@Autowired
	ReviewServiceImpl rService;
	@Autowired
	ActorCharacterServiceImpl ACService;
	@Autowired
	CharacterServiceImpl service;
	
	
	@Autowired
	ActorServiceImpl actorservice;
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	
	
	
	@RequestMapping(value = "/review/review", method = RequestMethod.GET)
	public String selectAllReview(Model model,@RequestParam(value="musical_id",defaultValue="1") Integer musical_id,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="perPageNum",defaultValue="10") int perPageNum,@RequestParam(value="sort",defaultValue="date") String sort)throws Exception{
								
		
		
		Double avgRating=rService.avgRating();
		
		BoardVo vo=new BoardVo();
		vo.setSort(sort);
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		Long roundRating=null;
		
		if(avgRating != null) roundRating = Math.round(avgRating); 
		
		
		vo.setTotalCount(rService.totalCount());
		ArrayList<ReviewDto>dto=rService.selectAll(musical_id,vo);
		System.out.println(dto);
		model.addAttribute("List",dto);
		model.addAttribute("avgRating",avgRating);
		model.addAttribute("boardVo",vo);
		model.addAttribute("roundRating",roundRating);
		return "review/review";
	}
	@RequestMapping(value = "/review/myReview", method = RequestMethod.GET)
	public String myReview(Model model,@RequestParam(value="customer_id",defaultValue="1") String customer_id,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="perPageNum",defaultValue="10") int perPageNum)throws Exception{
		BoardVo vo=new BoardVo();
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		vo.setTotalCount(rService.totalCount());
		ArrayList<ReviewDto>dto=rService.selectMyReview(customer_id,vo);
		System.out.println(dto);
		model.addAttribute("List",dto);
		model.addAttribute("boardVo",vo);
		return "review/myReview";
	}
	
	
	
	@RequestMapping(value = "/review/updateReview", method = RequestMethod.GET)
	public String updateReview()throws Exception{
		
		
		return "review/updateReview";
	}
	
	@RequestMapping(value = "/review/updateReview", method = RequestMethod.POST)
	public String updateRevieww(ReviewDto dto,Model model)throws Exception{
		
		rService.update(dto);
		model.addAttribute("review",dto);
		
		return "redirect:/review/review";
	}
	
	@RequestMapping(value = "/review/insertReview", method = RequestMethod.GET)
	public String insertReview(ReviewDto dto)throws Exception{
		
		
		
		System.out.println(dto);
		rService.insert(dto);
		return "redirect:/review/review";
	}
	
	@RequestMapping(value = "/review/deleteReview", method = RequestMethod.GET)
	public String deleteReview(int review_id)throws Exception{
		
		
		
		rService.delete(review_id);
		return "redirect:/review/review";
	}
	
	///////////////////////////////////////////////////////////

	@RequestMapping(value = "/character/characterList", method = RequestMethod.GET)
	public String selectAll(Model model)throws Exception{
		ArrayList<ActorCharacterDto>dto=ACService.selectAll();
		
		model.addAttribute("List",dto);
		System.out.println(dto);
		
		return "character/characterList";
	}
	@RequestMapping(value = "/character/readCharacter", method = RequestMethod.GET)
	public String readCharacter(Model model,Integer actor_id)throws Exception{
		
		ActorDto dto=actorservice.select(actor_id);
		
		model.addAttribute("actor",dto);
		System.out.println(dto);
		
		return "character/readCharacter";
	}
	@RequestMapping(value = "/character/updateActor", method = RequestMethod.GET)
	public String updateActor(Model model,ActorDto dto)throws Exception{
		
		
		
		actorservice.update(dto);
		System.out.println(dto);
		
		return "redirect:/character/readCharacter?actor_id="+dto.getActor_id();
	}
	@RequestMapping(value = "/character/deleteActor", method = RequestMethod.GET)
	public String deleteActor(int actor_id)throws Exception{
		actorservice.delete(actor_id);
		
		
		return "redirect:/character/characterList";
	}
	/////////////////////////////////////////////////////////////////

	

}
