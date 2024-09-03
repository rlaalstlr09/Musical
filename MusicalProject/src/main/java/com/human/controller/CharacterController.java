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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.human.service.WorksServiceImpl;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value = "/character")
public class CharacterController {

	@Autowired
	ActorCharacterServiceImpl ACService;
	@Autowired
	CharacterServiceImpl service;
	@Autowired
	ActorServiceImpl actorService;
	@Autowired
	WorksServiceImpl worksService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(CharacterController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "/readCharacter", method = RequestMethod.GET)
	public String readCharacter(Model model,Integer actor_id, Integer musical_id)throws Exception{
		
		ActorDto dto=actorService.select(actor_id);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		

		ArrayList<WorksDto> wdto=worksService.selectAll(actor_id);
		model.addAttribute("worksList",wdto);
		model.addAttribute("musical_id", musical_id);
		model.addAttribute("actor",dto);
		model.addAttribute("auth",auth);
		System.out.println(dto);
		System.out.println(wdto);		
		
		
		return "musical/fragments/readCharacter";
	}
	@RequestMapping(value = "/updateActor", method = RequestMethod.GET)
	public String updateActor(ActorDto dto,int musical_id)throws Exception{
		
		
		
		actorService.update(dto);
		System.out.println(dto);
		
		return "redirect:/musical/detail/" + musical_id;
	}
	@RequestMapping(value = "/deleteActor", method = RequestMethod.GET)
	public String deleteActor(int actor_id, int musical_id)throws Exception{
		actorService.delete(actor_id);
		return "redirect:/musical/detail/" + musical_id;
	}
	
	
	
	
	@RequestMapping(value = "/insertActor", method = RequestMethod.GET)//character테이블과 actor_character테이블에 데이터를 동시에 추가 actor_id는 null이어도 됨
	public void insertActorCharacter(CharacterDto dto)throws Exception {
		service.insert(dto);
		service.insertActorCharacter();
	}
	
	

	

}
