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

import com.human.service.QaServiceImpl;
import com.human.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value = "/qna")
public class QnaController {
	@Autowired
	QaServiceImpl QService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	
	
	
	
	
	@RequestMapping(value = "/updateQna", method = RequestMethod.GET)
	public String updateQna(QaDto dto,Model model)throws Exception{
		
		QService.updateQna(dto);
		
		model.addAttribute("musical_id", dto.getMusical_id());
		
		return "redirect:/tab/qna";
	}
	@RequestMapping(value = "/deleteQna", method = RequestMethod.GET)
	public String deleteQna(@RequestParam("qa_id")Integer qa_id,Model model,@RequestParam("musical_id")Integer musical_id)throws Exception{
		
		QService.deleteQna(qa_id);
		
		model.addAttribute("musical_id", musical_id);
		
		return "redirect:/tab/qna";
	}
	
	@RequestMapping(value = "/insertQna", method = RequestMethod.GET)
	public String insertReview(Integer musical_id, QaDto dto, Model model,Authentication authentication)throws Exception{
		dto.setCustomer_id(authentication.getName());
		if(dto.getDisplay()==null) {
			dto.setDisplay(1);
		}
		QService.insertQna(dto);
		System.out.println(dto);
		model.addAttribute("musical_id", musical_id);
		return "redirect:/tab/qna";
	}
	
	@RequestMapping(value = "/adResponse", method = RequestMethod.GET)
	public String adResponse(@RequestParam("qa_id")int qa_id ,@RequestParam("res")String res ,@RequestParam("musical_id")int musical_id ,Model model)throws Exception{
		
		
		QService.adResponse(qa_id,res);
		
		model.addAttribute("musical_id", musical_id);
		return "redirect:/tab/qna";
	}
	

}
