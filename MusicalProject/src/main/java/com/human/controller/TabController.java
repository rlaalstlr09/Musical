package com.human.controller;

import java.util.ArrayList;
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

import com.human.dto.ActorCharacterDto;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.ReviewDto;
import com.human.service.ActorCharacterServiceImpl;
import com.human.service.IMusicalService;
import com.human.service.ISeatService;
import com.human.service.ReviewServiceImpl;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/tab")
public class TabController {
	@Autowired
	ReviewServiceImpl rService;
	@Autowired
	ActorCharacterServiceImpl ACService;

	@RequestMapping("/review")
	public String reviewTab(Model model, @RequestParam(value = "musical_id") Integer musical_id,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,
			@RequestParam(value = "sort", defaultValue = "date") String sort) throws Exception {

		Double avgRating = rService.avgRating();

		BoardVo vo = new BoardVo();
		vo.setSort(sort);
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		Long roundRating = null;

		if (avgRating != null)
			roundRating = Math.round(avgRating);

		vo.setTotalCount(rService.totalCount());
		ArrayList<ReviewDto> dto = rService.selectAll(musical_id, vo);
		System.out.println(dto);
		System.out.println(musical_id);
		model.addAttribute("List", dto);
		model.addAttribute("avgRating", avgRating);
		model.addAttribute("boardVo", vo);
		model.addAttribute("roundRating", roundRating);
		model.addAttribute("musical_id", musical_id);
		return "musical/fragments/review";

	}
	
	@RequestMapping(value = "/character", method = RequestMethod.GET)
	public String selectAll(Integer musical_id, Model model)throws Exception{
		ArrayList<ActorCharacterDto>dto=ACService.selectAll(musical_id);
		
		model.addAttribute("List",dto);
		System.out.println(dto);
		
		return "musical/fragments/character";
	}
}
