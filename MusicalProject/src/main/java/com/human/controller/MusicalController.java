package com.human.controller;


import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.human.dto.ActorCharacterDto;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.dto.ReviewDto;
import com.human.service.IActorCharacterService;
import com.human.service.IMusicalService;
import com.human.service.IReviewService;
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
	@Autowired
	private IReviewService reviewService;
	@Autowired
	private IActorCharacterService actorCharacterService;
	
	//뮤지컬 리스트 페이지
	@RequestMapping("/listAll")
	public String listAll(@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "perPageNum", defaultValue = "25") int perPageNum,
			MusicalFilterDto filter, Model model)
			throws Exception {

		// BoardVo 객체 생성 및 설정
		BoardVo boardVo = new BoardVo();
		boardVo.setPage(page);
		boardVo.setPerPageNum(perPageNum);
		
		//카테고리별 뮤지컬 개수 (인기순, 오픈순 등등) 고정값으로 넣어서 페이지 전환해도 값 그대로
		BoardVo categoryVo = new BoardVo();
		categoryVo.setPage(0);
		categoryVo.setPerPageNum(10);
		
		// 상영시간 필터를 위해 최소 상영시간에 따른 최대 상영시간 계산
		if (filter.getMinRunningtime() == 1) {
			filter.setMaxRunningtime(90);
		} else if (filter.getMinRunningtime() == 91) {
			filter.setMaxRunningtime(120);
		} else if (filter.getMinRunningtime() == 121) {
			filter.setMaxRunningtime(150);
		} else if (filter.getMinRunningtime() == 151) {
			filter.setMaxRunningtime(180);
		} else {
			filter.setMaxRunningtime(500);
		}
		
		// 총 데이터 개수와 페이징 데이터 계산
		int totalCount = musicalService.getTotalCount(filter);
		boardVo.setTotalCount(totalCount);
		System.out.println(totalCount);

		// 데이터 가져오기
		List<MusicalDto> musicalList = musicalService.selectAllMusical(boardVo, filter);
		
		MusicalFilterDto musicalFilterDto = new MusicalFilterDto();
		
		//인기순 10개
		musicalFilterDto.setSort("like");
		List<MusicalDto> likeMusical = musicalService.selectAllMusical(categoryVo, musicalFilterDto);
		
		//최근 오픈 10개
		musicalFilterDto.setSort("period");
		List<MusicalDto> dateMusical = musicalService.selectAllMusical(categoryVo, musicalFilterDto);
		
		// 모델에 데이터와 페이지, 필터링 조건 추가
		model.addAttribute("musicals", musicalList);
		model.addAttribute("likeMusicals", likeMusical);
		model.addAttribute("dateMusicals", dateMusical);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("filter", filter);

		return "musical/list"; // JSP 뷰 이름
	}

	//뮤지컬 리스트에서 뮤지컬 선택하면 해당 뮤지컬 상세보기
	@RequestMapping(value = "/detail/{musical_id}")
	public String musicalDetail(
			@PathVariable("musical_id") Integer musical_id, 
			HttpServletRequest request,
			Integer total_likes,
			Model model) throws Exception {

		MusicalDto musicalDto = new MusicalDto(musicalService.selectMusicalId(musical_id),
				seatService.selectSeatInfo(musical_id));
		
		List<MusicalScheduleDto> schedules = musicalService.selectMusicalSchedule(musical_id);
		
		Map<MusicalScheduleDto, List<String>> scheduleMap = new LinkedHashMap<>();
		for (MusicalScheduleDto schedule : schedules) {
			MusicalScheduleDto date = new MusicalScheduleDto();
			date.setMu_sch_date(schedule.getFormattedDate());
			if (!scheduleMap.containsKey(date)) {
				scheduleMap.put(date, new ArrayList<>());
			}
			scheduleMap.get(date).add(schedule.getFormattedTime());
		}

	    
		BoardVo vo = new BoardVo();
	
		//최상위 리뷰 3개 표출을 위한 vo 설정
		vo.setPage(0);
		vo.setPerPageNum(3);
		vo.setSort("rating");
		
		List<ReviewDto> reviews = reviewService.selectAll(musical_id, vo);
		
		//등장인물 별 배우이름 받아옴
		List<ActorCharacterDto> actorCharacterDto = actorCharacterService.selectAll(musical_id);

		//customer_id 세션에서 받아온걸로 바꾸기
		 Principal principal = request.getUserPrincipal();
		 Integer isLike = 0;
		 
         if (principal != null) {
             String customer_id = principal.getName();
             isLike = musicalService.selectMusicalLike(musical_id, customer_id);
         }
         
         System.out.println(actorCharacterDto);

		// 뮤지컬 정보
		model.addAttribute("musical", musicalDto);

		// 뮤지컬 일정
		model.addAttribute("schedules", schedules);
		model.addAttribute("scheduleMap", scheduleMap);

		// 해당 사용자가 해당 뮤지컬에 좋아요를 눌렀는지 여부
		model.addAttribute("isLike", isLike);
		
		//뮤지컬 상세정보에 표출할 평점 높은순 3개
		model.addAttribute("reviews", reviews);

		//뮤지컬 등장인물 별 배우 이름
		model.addAttribute("actors", actorCharacterDto);

		return "musical/detail";
	}

	//공연장 정보
	@GetMapping("/venue")
	public String getVenue(MusicalDto musicalDto, Model model) {
		model.addAttribute("param", musicalDto);
		return "musical/fragments/venue";
	}

	//뮤지컬 좋아요 누르면 동작
	@PostMapping("/like")
	public ResponseEntity<String> likeToggle(
			@RequestParam("musical_id") Integer musical_id, 
			HttpServletRequest request,
			Model model) {
		 Principal principal = request.getUserPrincipal();
		 String customer_id = null;
		 
         if (principal != null) {
             customer_id = principal.getName();
         }
         
		System.out.println(customer_id);
		
		//로그인 안한 상태. 로그인페이지로 리다이렉트하게 바꾸셈
		if (customer_id == null || customer_id.trim().isEmpty()) {
			 
            return new ResponseEntity<String>("redirect", HttpStatus.OK);
	    }

	    try {
	    	//좋아요 이미 눌러진 상태에서 버튼 누르면 삭제
	        if (musicalService.selectMusicalLike(musical_id, customer_id) == 1) {
	            musicalService.deleteLike(musical_id, customer_id);
	        } else {
	            musicalService.insertLike(musical_id, customer_id);
	        }
	        return new ResponseEntity<String>("success", HttpStatus.OK);
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<String>("failed", HttpStatus.OK);
	    }
	}
	
	@GetMapping("/test")
	public String getTest(Model model) {
		return "musical/test";
	}
}
