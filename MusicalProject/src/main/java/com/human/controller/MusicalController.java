package com.human.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.dto.MusicalDto;
import com.human.service.IMusicalService;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/musical")
public class MusicalController {
	
	@Autowired
	private IMusicalService musicalService;
	
	  @RequestMapping("/listAll")
	    public String listAll(
	            @RequestParam(value = "page", defaultValue = "1") int page,
	            @RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,
	            Model model) throws Exception {

	        // BoardVo 객체 생성 및 설정
	        BoardVo boardVo = new BoardVo();
	        boardVo.setPage(page);
	        boardVo.setPerPageNum(perPageNum);

	        // 총 데이터 개수와 페이징 데이터 계산
	        int totalCount = musicalService.getTotalCount();
	        boardVo.setTotalCount(totalCount);

	        // 데이터 가져오기
	        List<MusicalDto> musicalList = musicalService.selectAllMusical(boardVo);

	        // 모델에 데이터와 페이지 정보 추가
	        model.addAttribute("musicalList", musicalList);
	        model.addAttribute("boardVo", boardVo);
	        
	        return "musical/list";  // JSP 뷰 이름
	    }

}



