package com.human.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.dto.MainImgDto;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.service.IMainImgService;
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
		@Autowired
	private IMainImgService mainimgService;
	
	  @RequestMapping("/")
	    public String Main(Model model) throws Exception {

	        // BoardVo 객체 생성 및 설정
	        BoardVo boardVo = new BoardVo();
	        boardVo.setPage(0);
	        boardVo.setPerPageNum(10);
	        List<MainImgDto> dto1 = mainimgService.select_img(1);
	        List<MainImgDto> dto2 = mainimgService.select_img(2);
	        List<MainImgDto> dto3 = mainimgService.select_img(3);
	        List<MainImgDto> dto4 = mainimgService.select_img(4);
	        List<MainImgDto> dto5 = mainimgService.select_img(5);
	        List<MainImgDto> dto6 = mainimgService.select_img(6);
	        List<MainImgDto> dto7 = mainimgService.select_img(7);
	        List<MainImgDto> dto8 = mainimgService.select_img(8);
	        List<MainImgDto> dto9 = mainimgService.select_img(9);
	        
	        
	        // dto1 출력
	        System.out.println("DTO1 내용:");
	        for (MainImgDto img : dto1) {
	            System.out.println(img);
	        }

	        // dto2 출력
	        System.out.println("DTO2 내용:");
	        for (MainImgDto img : dto2) {
	            System.out.println(img);
	        }

	        model.addAttribute("img_set1",dto1);
	        model.addAttribute("img_set2",dto2);
	        model.addAttribute("img_set3",dto3);
	        model.addAttribute("img_set4",dto4);
	        model.addAttribute("img_set5",dto5);
	        model.addAttribute("img_set6",dto6);
	        model.addAttribute("img_set7",dto7);
	        model.addAttribute("img_set8",dto8);
	        model.addAttribute("img_set9",dto9);
	        
	        
	        // 총 데이터 개수와 페이징 데이터 계산
	        int totalCount = musicalService.getTotalCount(new MusicalFilterDto());
	        boardVo.setTotalCount(totalCount);
	        System.out.println(totalCount);
	        // 데이터 가져오기
	        
	        MusicalFilterDto musicalFilterDto = new MusicalFilterDto();
	        musicalFilterDto.setSort("period");
	        musicalFilterDto.setKeyword("");
	        List<MusicalDto> musicalPeriod = musicalService.selectAllMusical(boardVo, musicalFilterDto);
	        
	        System.out.println(totalCount);
	        System.out.println(boardVo);

	        // 모델에 데이터와 페이지 정보 추가
	        model.addAttribute("musicalPeriod", musicalPeriod);
	        
	        return "home";  // JSP 뷰 이름
	    }
	  
	 
}




