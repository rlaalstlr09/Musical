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
@RequestMapping(value = "/review")
public class ReviewController {
	@Autowired
	ReviewServiceImpl rService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String selectAllReview(
			Model model,
			@RequestParam(value="musical_id",defaultValue="1") Integer musical_id,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="perPageNum",defaultValue="10") int perPageNum,
			@RequestParam(value="sort",defaultValue="date") String sort)throws Exception{
								
		
		
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
		return "/ex/musical/review";
	}
	
	@RequestMapping(value = "/myReview", method = RequestMethod.GET)
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
	
	
	
	@RequestMapping(value = "/updateReview", method = RequestMethod.GET)
	public String updateReview()throws Exception{
		
		return "review/updateReview";
	}
	
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateRevieww(ReviewDto dto)throws Exception{
		
		rService.update(dto);
		
		
		return "redirect:/review/review";
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(Integer musical_id, ReviewDto dto, Model model)throws Exception{
		
		rService.insert(dto);
		model.addAttribute("musical_id", musical_id);
		return "redirect:/tab/review";
	}
	
	@RequestMapping(value = "/deleteReview", method = RequestMethod.GET)
	public String deleteReview(Integer musical_id, int review_id, Model model)throws Exception{
		
		rService.delete(review_id);
		model.addAttribute("musical_id", musical_id);
		return "redirect:/tab/review";
	}
	

}
