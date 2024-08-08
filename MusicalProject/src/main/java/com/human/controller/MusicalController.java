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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/musical")
public class MusicalController {
	
	@Autowired
	private IMusicalService musicalService;
	
	@RequestMapping("/")
	public void musicalList() {
		
	}
}



