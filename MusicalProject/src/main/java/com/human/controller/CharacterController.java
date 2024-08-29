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
@RequestMapping(value = "/character")
public class CharacterController {

	@Autowired
	ActorCharacterServiceImpl ACService;
	@Autowired
	CharacterServiceImpl service;
	@Autowired
	ActorServiceImpl actorservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CharacterController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "/readCharacter", method = RequestMethod.GET)
	public String readCharacter(Model model,Integer actor_id)throws Exception{
		
		ActorDto dto=actorservice.select(actor_id);
		
		model.addAttribute("actor",dto);
		System.out.println(dto);
		
		return "musical/fragments/readCharacter";
	}
	@RequestMapping(value = "/updateActor", method = RequestMethod.GET)
	public String updateActor(Model model,ActorDto dto)throws Exception{
		
		
		
		actorservice.update(dto);
		System.out.println(dto);
		
		return "redirect:/character/readCharacter?actor_id="+dto.getActor_id();
	}
	@RequestMapping(value = "/deleteActor", method = RequestMethod.GET)
	public String deleteActor(int actor_id)throws Exception{
		actorservice.delete(actor_id);
		
		
		return "redirect:/tab/character";
	}
	/////////////////////////////////////////////////////////////////

	

}
