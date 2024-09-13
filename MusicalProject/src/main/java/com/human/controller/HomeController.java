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
import com.human.vo.PageVo;

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
		  
		  	//초기화
		  	BoardVo vo = new BoardVo();
		  	MusicalFilterDto filter = new MusicalFilterDto(null, null, 0, 0, 500, null, null, null);
		  	
		  	//뮤지컬 4개 가져옴
		  	vo.setPerPageNum(6);
		  	
		  	//최근오픈순 정렬 (like - 좋아요순, period - 최근오픈순, title - 제목순, 그 외 - musical_id순 정렬)
		  	filter.setSort("period");
		  	
		  	//조건에 해당하는 뮤지컬 저장
		  	List<MusicalDto> openMusical = musicalService.selectAllMusical(vo, filter);
		  	
		  	//모델에 저장해서 jsp에서 출력가능하도록 함
		  	model.addAttribute("openMusical", openMusical);
		  	
	        return "home";  // JSP 뷰 이름
	    }
	  
	 
}



