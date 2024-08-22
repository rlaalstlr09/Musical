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

	        // BoardVo 객체 생성 및 설정
	        BoardVo boardVo = new BoardVo();
	        boardVo.setPage(0);
	        boardVo.setPerPageNum(10);
	        
	        // 총 데이터 개수와 페이징 데이터 계산
	        int totalCount = musicalService.getTotalCount("", new MusicalFilterDto());
	        boardVo.setTotalCount(totalCount);
	        System.out.println(totalCount);
	        // 데이터 가져오기
	        List<MusicalDto> musicalPeriod = musicalService.selectAllMusical(boardVo, "", "period", new MusicalFilterDto());
	        
	        System.out.println(totalCount);
	        System.out.println(boardVo);

	        // 모델에 데이터와 페이지 정보 추가
	        model.addAttribute("musicalPeriod", musicalPeriod);
	        
	        return "index";  // JSP 뷰 이름
	    }
	  
	 
}



