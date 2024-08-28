package com.human.controller;

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

import com.human.dto.QaDto;
import com.human.service.IQaService;
import com.human.vo.BoardVo;

@Controller
@RequestMapping("/qna/*")
public class SearchQaContrller {

	@Autowired
	  private IQaService service;
	private static final Logger logger = LoggerFactory.getLogger(CustomerMoveController.class);
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGet() throws Exception {
		//return "/sboard/write
	
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePost(QaDto board,RedirectAttributes rttr) throws Exception {
		service.write(board);
		//rttr.addAttribute("msg","success");
		rttr.addFlashAttribute("msg","success");
		return "redirect:/member/myPage";		
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("qa_id") int qa_id,BoardVo vo,Model model) throws Exception {
		System.out.println(vo);
		model.addAttribute(service.read(qa_id));
		//return "/sboard/read
	}

	// update문(아직 구현X)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam("qa_id") int qa_id,BoardVo vo,Model model) throws Exception {
		System.out.println(vo);
		model.addAttribute(service.read(qa_id));
	}

//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String modifyPost(QaDto board,BoardVo vo,Model model,RedirectAttributes rttr) throws Exception {
//		service.modify(board);
//		System.out.println(vo);
//		
//		rttr.addAttribute("page", vo.getPage());
//		rttr.addAttribute("perPageNum", vo.getPerPageNum());
//		rttr.addAttribute("searchType", vo.getSearchType());
//		rttr.addAttribute("keyword", vo.getKeyword());
//
//		rttr.addFlashAttribute("msg","success");
//		return "redirect:/qna/list";	
//	}

	
	@RequestMapping(value = "/qa_list", method = RequestMethod.GET)
	public String qa_list(@RequestParam("customer_id") String customer_id,BoardVo vo, Model model) throws Exception{
		
		List<QaDto> List = service.qa_list(vo, customer_id);
		model.addAttribute("list",List);
		vo.setTotalCount(service.qa_listCount(customer_id));
		return "/qna/qa_list";
	}
	
}









