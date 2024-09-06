package com.human.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.human.dto.FaqDto;
import com.human.dto.MusicalDto;
import com.human.dto.NoticeDto;
import com.human.dto.QaDto;
import com.human.dto.Venue_apiDto;
import com.human.service.IFaqService;
import com.human.service.INoticeService;
import com.human.service.IQaService;
import com.human.service.IVenue_apiService;
import com.human.vo.BoardVo;

@Controller
@RequestMapping("/help/*")
public class CSController {
	@Autowired
	private IFaqService service;

	@Autowired
	private INoticeService nservice;
	
	
	@Autowired
	private IVenue_apiService venue_apiservice;
	
	
	

	@RequestMapping(value = "/help_main", method = RequestMethod.GET)
	public String help_main(BoardVo vo, Model model) throws Exception{
		vo.setPerPageNum(3);
		List<NoticeDto> searchList = nservice.listSearch(vo);
		model.addAttribute("list", searchList);	
		return "help/help_main";
	}
	
	@RequestMapping(value = "/near_map", method = RequestMethod.GET)
	public String near_map() {
		return "help/near_map";
	}
	
	@RequestMapping(value = "/inform", method = RequestMethod.GET)
	public String inform() {
		return "help/inform";
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(BoardVo vo, Model model) throws Exception {
		List<FaqDto> searchList = service.listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(service.listSearchCount(vo));
		return "/help/faq";
	}

	@RequestMapping(value = "/faq_register", method = RequestMethod.GET)
	public String faq_register() {
		return "/help/faq_register";
	}

	@RequestMapping(value = "/faq_register", method = RequestMethod.POST)
	public String registPOST(FaqDto faq, Model model, RedirectAttributes rttr) throws Exception {
		service.create(faq);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/help/faq";
	}

	@RequestMapping(value = "/faq_modify", method = RequestMethod.GET)
	public void modifyGET(int fId, Model model) throws Exception {
		model.addAttribute("FaqDto", service.read(fId));
	}

	@RequestMapping(value = "/faq_modify", method = RequestMethod.POST)
	public String modifyPOST(FaqDto faq, RedirectAttributes rttr) throws Exception {

		service.update(faq);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/help/faq";
	}

	@RequestMapping(value = "/faq_remove", method = RequestMethod.POST)
	public String remove(@RequestParam("fId") int fId, RedirectAttributes rttr) throws Exception {
		service.delete(fId);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/help/faq";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(BoardVo vo, Model model) throws Exception {
		List<NoticeDto> searchList = nservice.listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(nservice.listSearchCount(vo));
		return "/help/notice";
	}

	@RequestMapping(value = "/notice_register", method = RequestMethod.GET)
	public String notice_register() {
		return "/help/notice_register";
	}

	@RequestMapping(value = "/notice_register", method = RequestMethod.POST)
	public String notice_registPOST(NoticeDto notice, Model model, RedirectAttributes rttr) throws Exception {
		nservice.create(notice);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/help/notice";
	}

	@RequestMapping(value = "/notice_modify", method = RequestMethod.GET)
	public void notice_modifyGET(int nId, Model model) throws Exception {
		model.addAttribute("noticeDto", nservice.read(nId));
	}
	
	@RequestMapping(value = "/notice_read", method = RequestMethod.GET)
	public void notice_read(int nId, Model model) throws Exception {
		model.addAttribute("noticeDto", nservice.read(nId));
		nservice.nHitUpdate(nId);
	}

	@RequestMapping(value = "/notice_modify", method = RequestMethod.POST)
	public String notice_modifyPOST(NoticeDto notice, RedirectAttributes rttr) throws Exception {
		nservice.update(notice);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/help/notice";
	}

	@RequestMapping(value = "/notice_remove", method = RequestMethod.POST)
	public String notice_remove(@RequestParam("nId") int nId, RedirectAttributes rttr) throws Exception {
		nservice.delete(nId);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/help/notice";
	}
	
	
	
	@RequestMapping("/getTheaters")	
    @ResponseBody
    public List<Venue_apiDto> getTheaters(@RequestParam("lat") double lat, 
                                        @RequestParam("lon") double lon, 
                                        @RequestParam("distance") double distance) throws Exception {
        return venue_apiservice.getTheaters(lat, lon, distance);
    }
    
    @RequestMapping(value = "/getTheater", method = RequestMethod.POST)	
    @ResponseBody
    public List<MusicalDto> getTheater(@RequestParam("venue_id") int venue_id) throws Exception {
    	System.out.println(venue_apiservice.getTheater(venue_id).size());
        return venue_apiservice.getTheater(venue_id);
    }
    
}
