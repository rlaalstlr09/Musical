package com.human.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.dto.HallDto;
import com.human.dto.MusicalScheduleDto;
import com.human.dto.ReservationDto;
import com.human.dto.SeatDto;
import com.human.dto.VenueDto;
import com.human.service.IHallService;
import com.human.service.IMusicalScheduleService;
import com.human.service.IMusicalService;
import com.human.service.IReservationService;
import com.human.service.ISeatService;
import com.human.service.IVenueService;
import com.human.vo.PageVo;

@Controller
@RequestMapping(value = "/reser_admin")
public class Reser_adminController {
	private static final Logger logger = LoggerFactory.getLogger(Reser_adminController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private IMusicalScheduleService mu_schservice;
	@Autowired
	private ISeatService seatservice;
	@Autowired
	private IReservationService reservationservice;
	@Autowired
	private IHallService hallservice;
	@Autowired
	private IVenueService venueservice;
	@Autowired
	private IMusicalService musicalservice;
	

	
	//////////////////// 뮤지컬 스케줄 바꾸기
	@RequestMapping(value = "/mu_sch_update_admin", method = RequestMethod.GET)
	public String mu_sch_update_admin(@RequestParam("mu_sch_id") int mu_sch_id, Model model, HttpSession session) throws Exception {


		MusicalScheduleDto dto = mu_schservice.select_mu_sch_id(mu_sch_id);
		List<VenueDto> venuedtos = venueservice.venue_list();
		List<HallDto> halldtos = hallservice.hall_list_venue(dto.getVenue_id());
		dto.setMu_sch_date(dto.getMu_sch_date());
		model.addAttribute("mu_sch_dto", dto);
		model.addAttribute("venuedtos", venuedtos);
		model.addAttribute("halldtos", halldtos);
		model.addAttribute("musicaldtos", musicalservice.musical_list());
		return "admin/mu_sch_update_admin";

	}
	
	@RequestMapping(value = "/mu_sch_update_admin", method = RequestMethod.POST)
	public String mu_sch_update(@ModelAttribute MusicalScheduleDto mu_sch_dto,Model model) throws Exception {
		
		System.out.println("mu_sch_update");
		mu_schservice.mu_sch_update(mu_sch_dto);
		
		return "home";
	}



	//////////////////////////////////////////// 
	@RequestMapping(value = "/reservation_list_admin", method = RequestMethod.GET)
	public String reservation_list_admin(
			@RequestParam(value = "status", required = false, defaultValue = "3") Integer  status,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			Model model,PageVo vo, HttpSession session) throws Exception {

	    if (status == null) {
	        status = 3; 
	    }
	    startDate = (startDate == null || startDate.trim().isEmpty()) ? null : startDate;
	    endDate = (endDate == null || endDate.trim().isEmpty()) ? null : endDate;
	
		List<ReservationDto> dtos;
	    if (startDate == null || endDate == null) {
	        dtos = reservationservice.admin_reservation_check_page_all(status, page, 10);
	        vo.setTotalcount(reservationservice.admin_reservation_check_total_all(status));
	    } else {
	    	
	        dtos = reservationservice.admin_reservation_check_page(startDate, endDate, status,page,10);
	        vo.setTotalcount(reservationservice.admin_reservation_check_total( startDate, endDate,status));
	    }
		 
	    
		for(ReservationDto dto : dtos) {
			MusicalScheduleDto mu_dto = mu_schservice.mu_sch_info(dto.mu_sch_id);
			String date_only = mu_dto.getMu_sch_date().substring(0,10);
			mu_dto.setMu_sch_date(date_only);
			dto.mu_sch_dto=mu_dto;
			dto.setMusical_name(musicalservice.musical_title(mu_dto.getMusical_id()));
			dto.setVenue_name(venueservice.venue_name(mu_dto.getVenue_id()));
			
		}
		
		
		model.addAttribute("reservationdtos", dtos);
		
		
		model.addAttribute("page", page);
		model.addAttribute("startPage", vo.getStartPage());
		model.addAttribute("totalendPage", vo.getTotalendPage());
		
		return "reser_admin/reservation_list_admin";
		
	}
	

	@RequestMapping(value = "/seat_check", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<SeatDto> seat_check(@RequestParam("reservation_id") int reservation_id) throws Exception {
		System.out.println("Fetching schedule for reservation_id: " + reservation_id);
		List<SeatDto> dtos = seatservice.seat_reservation_check(reservation_id);
		System.out.println(dtos.toString());
		return dtos;
	}

	@RequestMapping(value = "/reservation_cancel", method = RequestMethod.POST)
	@ResponseBody
	public void reservation_cancel(@RequestParam("reservation_id") int reservation_id, Model model) throws Exception {
		System.out.println("reservation_cancel");
		reservationservice.reservation_cancel(reservation_id);
		seatservice.seat_cancel(reservation_id);

	}
	
	
	

	////////////////////////////////////////////////////////
	
	
	@RequestMapping(value = "/reservation_mu_sch_admin", method = RequestMethod.GET)
	public String reservation_mu_sch_admin(@RequestParam("mu_sch_id") int mu_sch_id, Model model,HttpSession session) throws Exception {

		System.out.println("seat_select");
		List<SeatDto> dtos = seatservice.seat_select(mu_sch_id);
		System.out.print(dtos.toString());

		model.addAttribute("mu_sch_id", mu_sch_id);
		model.addAttribute("seatdtos", dtos);
		return "reser_admin/reservation_mu_sch_admin";
	}

	
	@RequestMapping(value = "/reservation_mu_sch_seat_admin", method = RequestMethod.GET)
	public String reservation_mu_sch_seat_admin(@RequestParam("mu_sch_id") int mu_sch_id, Model model,HttpSession session) throws Exception {

		System.out.println("reservation_mu_sch_seat_admin");
		List<SeatDto> dtos = seatservice.seat_select(mu_sch_id);
		//model.addAttribute("mu_sch_id", mu_sch_id);
		
		List<ReservationDto> dtolists=reservationservice.reservation_mu_sch_id(mu_sch_id);
		model.addAttribute("seatdtos", dtos);
		model.addAttribute("reservationdtos", dtolists);
		return "reser_admin/reservation_mu_sch_seat_admin";
	}
	
	
	@RequestMapping(value = "/admin_check_seat", method = RequestMethod.GET)
	@ResponseBody
	public ReservationDto admin_check_seat(@RequestParam("reservation_id") int reservation_id, Model model,HttpSession session) throws Exception {
		System.out.println("admin_check_seat");
		ReservationDto dto =reservationservice.reservation_id(reservation_id);
		
		return dto;
	}
	
	
	
	
	
	
	
	

	////////////////////////////////////////admin 뮤지컬 스케줄 추가
		
	@RequestMapping(value = "/mu_sch_admin", method = RequestMethod.GET)
	public String mu_sch_admin(Model model,HttpSession session) throws Exception {
		System.out.println("mu_sch_admin");
		model.addAttribute("musicaldtos", musicalservice.musical_list());
		model.addAttribute("venuedtos",venueservice.venue_list() );
		return "reser_admin/mu_sch_admin";
	}
	@RequestMapping(value = "/mu_sch_admin", method = RequestMethod.POST)
	public String mu_sch_adminDB(@ModelAttribute MusicalScheduleDto mu_schdto,Model model) throws Exception {
		System.out.println("mu_sch_adminDB");
		System.out.println(mu_schdto.toString());
		int mu_sch_id = seatservice.seat_create_seq();
		mu_schdto.setMu_sch_id(mu_sch_id);	
		mu_schservice.insert_mu_sch(mu_schdto);
		
		
		SeatDto seatdto =new SeatDto();
		seatdto.setHall_id(mu_schdto.getHall_id());
		seatdto.setMu_sch_id(mu_sch_id);
		seatdto.setMusical_id(mu_schdto.getMusical_id());
		seatdto.setSeat_price(5000);
		
		seatservice.manage_seats(seatdto);
		return "home";
	}
		
	@RequestMapping(value = "/venue_select", method = RequestMethod.GET)
	@ResponseBody
	public List<HallDto> venue_select(@RequestParam("venue_id") int venue_id) throws Exception {
	    System.out.println("venue_select");
	    List<HallDto> halldtos= hallservice.hall_list_venue(venue_id);
	    return halldtos;
	}

	
	
	////////////////////////////////////////////////////////////
	
	

	
	
	
	
	

}
