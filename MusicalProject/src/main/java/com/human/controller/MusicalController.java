package com.human.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.service.IMusicalService;
import com.human.service.ISeatService;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/musical")
public class MusicalController {
	
	@Autowired
	private IMusicalService musicalService;
	@Autowired
	private ISeatService seatService;
	
	  @RequestMapping("/listAll")
	    public String listAll(
	            @RequestParam(value = "page", defaultValue = "1") int page,
	            @RequestParam(value = "perPageNum", defaultValue = "10") int perPageNum,
	            @RequestParam(value = "keyword", defaultValue = "") String keyword,
	            @RequestParam(value = "sort", defaultValue = "") String sort,
	            MusicalFilterDto filter,
	            Model model) throws Exception {

	        // BoardVo 객체 생성 및 설정
	        BoardVo boardVo = new BoardVo();
	        boardVo.setPage(page);
	        boardVo.setPerPageNum(perPageNum);

	        // 총 데이터 개수와 페이징 데이터 계산
	        int totalCount = musicalService.getTotalCount(keyword, filter);
	        boardVo.setTotalCount(totalCount);
	        
	        //상영시간 필터를 위해 최소 상영시간에 따른 최대 상영시간 계산
	        if(filter.getMinRunningtime() == 1) {
	        	filter.setMaxRunningtime(90);
	        }
	        else if(filter.getMinRunningtime() == 91) {
	        	filter.setMaxRunningtime(120);
	        }
	        else if(filter.getMinRunningtime() == 121) {
	        	filter.setMaxRunningtime(150);
	        }
	        else if(filter.getMinRunningtime() == 151) {
	        	filter.setMaxRunningtime(180);
	        }
	        else {
	        	filter.setMaxRunningtime(500);
	        }
	        System.out.println(filter);
	        
	        // 데이터 가져오기
	        List<MusicalDto> musicalList = musicalService.selectAllMusical(boardVo, keyword, sort, filter);
	        
	        System.out.println(totalCount);
	        System.out.println(boardVo);
	        System.out.println(musicalList);
	        

	        // 모델에 데이터와 페이지, 필터링 조건 추가
	        model.addAttribute("musicals", musicalList);
	        model.addAttribute("boardVo", boardVo);
	        model.addAttribute("keyword", keyword);
	        model.addAttribute("filter", filter);
	      
	        
	        return "musical/list";  // JSP 뷰 이름
	    }
	  
	  @RequestMapping(value = "/detail/{musical_id}")
	  public String musicalDetail(@PathVariable("musical_id")Integer musical_id, Model model) throws Exception {
		  
		  MusicalDto musicalDto = new MusicalDto(musicalService.selectMusicalId(musical_id), seatService.selectSeatInfo(musical_id));
		  
		  List<MusicalScheduleDto> schedules = musicalService.selectMusicalSchedule(musical_id);
		  
		  
		  System.out.println(schedules);
		  
		  boolean isLike = musicalService.selectMusicalLike(musical_id, "세션에서 받아온 유저 아이디");
		  
		  model.addAttribute("customer.customer_id", "세션에서 받아온 유저 아이디");
		  
		  //뮤지컬 정보
		  model.addAttribute("musical", musicalDto);
		  
		  //뮤지컬 일정 
		  model.addAttribute("schedules", schedules);
		  
		  //해당 사용자가 해당 뮤지컬에 좋아요를 눌렀는지 여부
		  model.addAttribute("isLike", isLike);
		  
		  return "musical/detail";
	  }
	  
	  @GetMapping("/{tabId}")
	    public String getMusicalTabContent(@PathVariable String tabId, Model model) {
	        //뮤지컬 상세보기 페이지 탭 구현
	        return "fragments/" + tabId;
	    }
	  
	  @PostMapping("/like")
	    @ResponseBody
	    public ResponseEntity<?> likeToggle(@RequestBody String customer_id, @RequestBody Integer musical_id) {
	        try {
	            if(musicalService.selectMusicalLike(musical_id, customer_id)) {
	            	musicalService.deleteLike(musical_id, customer_id);
	            }
	            else {
	            	musicalService.insertLike(musical_id, customer_id);
	            }
	            return ResponseEntity.ok("Data inserted successfully");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error inserting data");
	        }
	    }
}



