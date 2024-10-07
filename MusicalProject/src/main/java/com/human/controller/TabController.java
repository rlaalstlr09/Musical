package com.human.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.human.dto.ActorCharacterDto;
import com.human.dto.AuthoritiesDto;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.QaDto;
import com.human.dto.ReviewDto;
import com.human.service.ActorCharacterServiceImpl;
import com.human.service.IAuthoritiesService;
import com.human.service.IMusicalService;
import com.human.service.ISeatService;
import com.human.service.MusicalServiceImpl;
import com.human.service.QaServiceImpl;
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
	@Autowired
	MusicalServiceImpl musicalService;
	@Autowired
	QaServiceImpl qnaService;
	@Autowired
	private IAuthoritiesService auService;
	@RequestMapping("/review")
	public String reviewTab(Model model, @RequestParam(value = "musical_id") Integer musical_id,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,
			@RequestParam(value = "sort", defaultValue = "date") String sort,Authentication authentication) throws Exception {

		Double avgRating = rService.avgRating(musical_id);

		BoardVo vo = new BoardVo();
		vo.setSort(sort);
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		Long roundRating = null;
		String customer_id = null;
		
		if (avgRating != null)
			roundRating = Math.round(avgRating);
		
		vo.setTotalCount(rService.totalCount(musical_id,customer_id));
		ArrayList<ReviewDto> dto = rService.selectAll(musical_id, vo);
		
		System.out.println(dto);
		System.out.println(musical_id);
		model.addAttribute("List", dto);
		model.addAttribute("avgRating", avgRating);
		model.addAttribute("boardVo", vo);
		model.addAttribute("roundRating", roundRating);
		model.addAttribute("musical_id", musical_id);
		if(authentication != null) {
			customer_id=authentication.getName();
		}
		model.addAttribute("customer_id", customer_id);
		return "musical/fragments/review";

	}
	@RequestMapping("/qna")
	public String qTab(Model model, @RequestParam(value = "musical_id") Integer musical_id,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,Authentication authentication
			) throws Exception {
		String customer_id="";
		if(authentication != null) {
		customer_id=authentication.getName();
		}
		BoardVo vo = new BoardVo();
		
		vo.setPage(page);
		vo.setPerPageNum(perPageNum);
		vo.setTotalCount(qnaService.totalCount(musical_id));
		String role="";
		AuthoritiesDto adto =auService.showQna(customer_id);
		if(adto!=null) {
			role=adto.getAuthority();
		}
		
		
		
		ArrayList<QaDto> dto = qnaService.selectAllQna(musical_id, vo);		
		model.addAttribute("customer_id",customer_id);
		model.addAttribute("List", dto);		
		model.addAttribute("boardVo", vo);		
		model.addAttribute("musical_id", musical_id);
		model.addAttribute("role", role);
		
		return "musical/fragments/qna";

	}
	
	
	@RequestMapping(value = "/character", method = RequestMethod.GET)
	public String characterTab(Integer musical_id, Model model)throws Exception{
		ArrayList<ActorCharacterDto>dto=ACService.selectAll(musical_id);
		
		model.addAttribute("List",dto);
		model.addAttribute("musical_id", musical_id);
		System.out.println(dto);
		
		return "musical/fragments/character";
	}
	
	
	@RequestMapping(value = "/sale", method = RequestMethod.GET)
	public String saleTab(Integer musical_id, Model model)throws Exception{
		ArrayList<ActorCharacterDto> actors = ACService.selectAll(musical_id);
		MusicalDto musical = musicalService.selectMusicalId(musical_id);
		
		model.addAttribute("actors",actors);
		model.addAttribute("musical", musical);
		
		return "musical/fragments/saleInfo";
	}
}
