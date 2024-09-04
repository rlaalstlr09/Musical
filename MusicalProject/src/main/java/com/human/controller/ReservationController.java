package com.human.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import com.human.service.IHallService;
import com.human.service.IMusicalService;
import com.human.service.IMusicalScheduleService;
import com.human.service.IReservationService;
import com.human.service.ISeatService;
import com.human.service.IVenueService;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

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
	
	

	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public void reservation(Model model) throws Exception {
		System.out.println("reservation");
	}

	////////////////////////// 극장 venue_id과 musical_id 는 현재 1로 고정 추후 뮤지컬 리스트 받으면
	////////////////////////// request르 받아서 구현
	@RequestMapping(value = "/select_date", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<MusicalScheduleDto> select_date(@RequestParam("date") String date) throws Exception {
		System.out.println("Fetching schedule for date: " + date);
		List<MusicalScheduleDto> dtos = mu_schservice.select_Musical_sch(date, 11, 1);

		for (MusicalScheduleDto schedule : dtos) {


			HallDto hall = hallservice.select_hall(schedule.getHall_id());

			int mu_sch_id = schedule.getMu_sch_id();
			int totalSeats = hall.getHall_total_seat();
			int availableSeats = seatservice.seat_count(mu_sch_id);
			String resultseat = String.valueOf(availableSeats) + "/" + String.valueOf(totalSeats);
			mu_schservice.mu_sch_seat_update(resultseat, mu_sch_id);
			
			
		}

		System.out.println(dtos.toString());
		return mu_schservice.select_Musical_sch(date, 1, 1);
	}

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void calendar(Model model) throws Exception {
		System.out.println("calendar");
	}

	@RequestMapping(value = "/seat_select", method = RequestMethod.GET)
	public void seat_select(@RequestParam("mu_sch_id") int mu_sch_id, Model model) throws Exception {
		System.out.println("seat_select");
		List<SeatDto> dtos = seatservice.seat_select(mu_sch_id);
		System.out.print(dtos.toString());

		model.addAttribute("mu_sch_id", mu_sch_id);
		model.addAttribute("seatdtos", dtos);

	}

	@Transactional
	@RequestMapping(value = "/seat_select", method = RequestMethod.POST)
	public String reservation_end(HttpServletRequest request, ReservationDto reservationdto, Model model)
			throws Exception {

		int reservation_id = reservationservice.reser_seq();
		reservationdto.setReservation_id(reservation_id);
		reservationservice.reservation_insert(reservationdto);
		System.out.println("reser_id : " + reservation_id);
		for (int i = 0; i < 4; i++) {
			String seat = request.getParameter("insert_seat" + i);

			if (seat != null && seat != "") {

				System.out.println("seat_id" + seat);
				seatservice.seat_reservation(Integer.parseInt(seat), reservation_id);
			}
		}
		System.out.println("cost : " + request.getParameter("total_cost"));
		return "home";
	}

	//////////////////////////////////////////// 로그인 기능 추가시 아이디 설정 현재는 customer 이름으로
	//////////////////////////////////////////// 찾는중
	@RequestMapping(value = "/reservation_check", method = RequestMethod.GET)
	public void reservation_check(Model model) throws Exception {
		System.out.println("reservation_check");
		List<ReservationDto> dtos = reservationservice.reservation_check("customer");

		model.addAttribute("reservationdtos", dtos);
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
	public String reservation_cancel(@RequestParam("reservation_id") int reservation_id, Model model) throws Exception {
		System.out.println("reservation_cancel");
		reservationservice.reservation_cancel(reservation_id);
		seatservice.seat_cancel(reservation_id);
		return "reservation_check";

	}

	////////////////////////////////////////admin 뮤지컬 스케줄 추가
		
	@RequestMapping(value = "/mu_sch_admin", method = RequestMethod.GET)
	public void mu_sch_admin(Model model) throws Exception {
		System.out.println("mu_sch_admin");
		model.addAttribute("musicaldtos", musicalservice.musical_list());
		model.addAttribute("venuedtos",venueservice.venue_list() );

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
		seatdto.setMusical_id(mu_schdto.getMusical_id()) ;
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
	
	
	
	@RequestMapping(value = "/select_dateex", method = RequestMethod.GET)
	public void select_dateex(Model model) throws Exception {
		System.out.println("seat_select");
	}
	
	
	
	
	
	
	
	

}