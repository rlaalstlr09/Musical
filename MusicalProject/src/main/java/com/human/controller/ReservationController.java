package com.human.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.human.dto.HallDto;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalScheduleDto;
import com.human.dto.ReservationDto;
import com.human.dto.SeatDto;
import com.human.service.IHallService;
import com.human.service.IMusicalScheduleService;
import com.human.service.IMusicalService;
import com.human.service.IReservationService;
import com.human.service.ISeatService;
import com.human.service.IVenueService;
import com.human.vo.PageVo;

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
	public void reservation(@RequestParam("venue_id")int venue_id,
			@RequestParam("musical_id")int musical_id,Model model) throws Exception {
		
		System.out.println("reservation");
		model.addAttribute("venue_id",venue_id);
		model.addAttribute("musical_id",musical_id);
		
		MusicalDto dto = musicalservice.musical_read(musical_id);
		model.addAttribute("musical",dto);
		
		model.addAttribute("start",dto.getFormattedMusical_period_start().substring(0,10));
		model.addAttribute("end",dto.getFormattedMusical_period_end().substring(0,10));
		
	}
	

	////////////////////////// 극장 venue_id과 musical_id 는 현재 1로 고정 추후 뮤지컬 리스트 받으면
	////////////////////////// request르 받아서 구현
	@RequestMapping(value = "/select_date", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<MusicalScheduleDto> select_date(@RequestParam("venue_id")int venue_id,
			@RequestParam("musical_id")int musical_id, @RequestParam("date") String date) throws Exception {
		System.out.println("Fetching schedule for date: " + date);
		List<MusicalScheduleDto> dtos = mu_schservice.select_Musical_sch(date, venue_id, musical_id);

		for (MusicalScheduleDto schedule : dtos) {


			HallDto hall = hallservice.select_hall(schedule.getHall_id());

			int mu_sch_id = schedule.getMu_sch_id();
			int totalSeats = hall.getHall_total_seat();
			int availableSeats = seatservice.seat_count(mu_sch_id);
			String resultseat = String.valueOf(availableSeats) + "/" + String.valueOf(totalSeats);
			mu_schservice.mu_sch_seat_update(resultseat, mu_sch_id);
			
			
		}

		System.out.println(dtos.toString());
		return dtos;
	}
	

	
	

	@RequestMapping(value = "/seat_select", method = RequestMethod.GET)
	public void seat_select(@RequestParam("mu_sch_id") int mu_sch_id, Model model) throws Exception {
		System.out.println("seat_select");
		List<SeatDto> dtos = seatservice.seat_select(mu_sch_id);
		System.out.print(dtos.toString());

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String customer = authentication.getName();
        
		model.addAttribute("mu_sch_id", mu_sch_id);
		model.addAttribute("seatdtos", dtos);
		model.addAttribute("customer", customer);
		
		MusicalDto dto = musicalservice.musical_read(mu_schservice.select_mu_sch_id(mu_sch_id).getMusical_id());
		model.addAttribute("musical",dto);
		model.addAttribute("date",mu_schservice.select_mu_sch_id(mu_sch_id).getMu_sch_date().substring(0,10));
		model.addAttribute("time",mu_schservice.select_mu_sch_id(mu_sch_id).getMu_sch_time());
		

	}

	@Transactional
	@RequestMapping(value = "/reservation_end", method = RequestMethod.POST)
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
		return "redirect:/musical/listAll";

	}

		
	
	@RequestMapping(value = "/reservation_list", method = RequestMethod.GET)
	public void reservation_list(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate,
            PageVo vo,Model model) throws Exception {
		System.out.println("reservation_list");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String customer = authentication.getName();
        System.out.println(startDate);
        System.out.println(endDate);
	    List<ReservationDto> dtos;
	    
	    
	    if (startDate != null && endDate != null) {
	        dtos = reservationservice.reservation_range(customer, page, 10, startDate, endDate);
	        vo.setTotalcount(reservationservice.total_reservation_range(customer, startDate, endDate));
	    } else {
	        dtos = reservationservice.reservation_check_page(customer, page, 10);
	        vo.setTotalcount(reservationservice.reservation_check_total(customer));
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
	
		
	}
	
	
	

	@RequestMapping(value = "/seat_check", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<SeatDto> seat_check(@RequestParam("reservation_id") int reservation_id) throws Exception {
		System.out.println("Fetching schedule for reservation_id: " + reservation_id);
		List<SeatDto> dtos = seatservice.seat_reservation_check(reservation_id);
		System.out.println(dtos.toString());
		return dtos;
	}
	
	
	
	//////////////////////좌석 예약 변경 아이디 세션값으로 해서 가져오기
	@RequestMapping(value = "/seat_update", method = RequestMethod.GET)
	public String seat_update(@RequestParam("mu_sch_id") int mu_sch_id,
			@RequestParam("reservation_id") int reservation_id,
			Model model, HttpSession session) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id=  authentication.getName();
		int seat_reservation =reservation_id;
		//예약 변경을 위하여 아이디 동인한지 확인하는작업 아이디 나중에 넣기
		String check_id =reservationservice.id_check(seat_reservation);
		MusicalDto dto = musicalservice.musical_read(mu_schservice.select_mu_sch_id(mu_sch_id).getMusical_id());
		model.addAttribute("musical",dto);
		model.addAttribute("date",mu_schservice.select_mu_sch_id(mu_sch_id).getMu_sch_date().substring(0,10));
		model.addAttribute("time",mu_schservice.select_mu_sch_id(mu_sch_id).getMu_sch_time());
	
		
		
	    if (id == null || !id.equals(check_id)) {
	        return "redirect:/";
	    }
		
		System.out.println("seat_update");
		List<SeatDto> dtos = seatservice.seat_select(mu_sch_id);
		System.out.println(dtos.toString());

		model.addAttribute("mu_sch_id", mu_sch_id);
		model.addAttribute("seatdtos", dtos);
		model.addAttribute("seat_reservation",seat_reservation);
		return "reservation/seat_update";
	}

	
	@Transactional
	@RequestMapping(value = "/seat_update", method = RequestMethod.POST)
	public String seat_update_DB(HttpServletRequest request, ReservationDto reservationdto
			,@RequestParam("mu_sch_id") int mu_sch_id, Model model, RedirectAttributes redirectAttributes)
			throws Exception {

		int reservation_id = reservationdto.reservation_id;

		////seat update  선택하고 하는 사이에 누군가가 예약했을 경우 중복예약 방지 체크
		///체크하고 만약 다른 예약이 들어오면 리다이렉트 
		System.out.println("reser_id : " + reservation_id);
		List<SeatDto> seat_checkdtos=seatservice.seat_reservation_check(reservation_id);
		
	
		
		for(int i=0;i<reservationdto.booked_count;i++) {
			int check_equal=0;
			int seat = Integer.parseInt(request.getParameter("insert_seat" + (i + 1)));
			
			for(int j=0;j<seat_checkdtos.size();j++) {
				 if(seat == seat_checkdtos.get(i).getSeat_id()) { 
					 check_equal = 1;
					 break;
				 }
			}
			
			if(check_equal == 0 && seatservice.seat_check(seat) !=0) {
	            redirectAttributes.addFlashAttribute("message", "이미 다른 사람이 예약한 좌석입니다.");
	            return "redirect:/reservation/seat_update?mu_sch_id="+mu_sch_id+"&seat_reservation="+reservation_id;
			}
		}
		/////체크가 전부 완료 되었으면 기존 예약 전부 취소
		seatservice.seat_cancel(reservation_id);
	
		////새로 바뀐 좌석 예약 재설정
		for(int i=0;i<reservationdto.booked_count;i++) {
			int seat = Integer.parseInt(request.getParameter("insert_seat" + (i + 1)));
			seatservice.seat_reservation(seat, reservation_id);
			System.out.println("seat_id" + seat);
		}

		///예약 변경
		
		
		
		
		
		
		return "reservation/reservation_list";
	}

	
	
	
	
	
	

	
	
	
	
	private static final String IMP_KEY = "4248828481266047"; 
    private static final String IMP_SECRET = "Og1NfjdEjh6BmTVHXqaDNWMlhqJXAlnWFHG4fMzbYK9KWkt50Bs8Lh1vM9WBR9JnSm5sr4WiHsA1vdeV"; 

    ///////////////////결제 취소를 위한 토큰 가져오기
    private String getAccessToken() throws Exception {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        Map<String, String> params = new HashMap<>();
        params.put("imp_key", IMP_KEY);
        params.put("imp_secret", IMP_SECRET);

        ObjectMapper mapper = new ObjectMapper();
        String jsonParams = mapper.writeValueAsString(params);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonParams.getBytes());
            os.flush();
        }

        if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
            return mapper.readTree(conn.getInputStream()).get("response").get("access_token").asText();
        } else {
            throw new RuntimeException("Failed to get access token");
        }
    }
	
	
	//////////////////////////////결제 취소 및 예약취소
    @RequestMapping(value = "/reservation_cancel", method = RequestMethod.POST)
	@ResponseBody
	public String  reservation_cancel(@RequestParam("reservation_id") int reservation_id,@RequestParam("merchant_uid") String merchant_uid, Model model) throws Exception {
		
		String token = getAccessToken();
    
        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", token);
        conn.setDoOutput(true);
        
        Map<String, String> params = new HashMap<>();
        params.put("reason", "기본 취소 사유");
        params.put("merchant_uid", merchant_uid); 
        ObjectMapper mapper = new ObjectMapper();
        String jsonParams = mapper.writeValueAsString(params);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonParams.getBytes());
            os.flush();
        }

        //성공하면 예약 테이블하고 좌석테이블의 값 재설정 및 변경
        if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
        	System.out.println("reservation_cancel");
    		reservationservice.reservation_cancel(reservation_id);
    		seatservice.seat_cancel(reservation_id);
            return "결제가 성공적으로 취소되었습니다.";
        } else {
            return "결제 취소에 실패했습니다.";
        }
        
	}
	
	
	

	


	
	
	////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/payment_list", method = RequestMethod.GET)
	public String showPaymentInfo(Model model) {
	    HttpURLConnection conn = null;
	    try {
	        String token = getAccessToken();
	        

	        // 아임포트 결제 조회 API 호출
	        URL url = new URL("https://api.iamport.kr/payments/status");
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + token);

	        int responseCode = conn.getResponseCode();
	        System.out.println("Request URL: " + url.toString());
	        System.out.println("Response Code: " + responseCode);
	        System.out.println("Response Message: " + conn.getResponseMessage());

	        if (responseCode == HttpURLConnection.HTTP_OK) {
	            try (InputStream is = conn.getInputStream()) {
	                ObjectMapper mapper = new ObjectMapper();
	                JsonNode paymentData = mapper.readTree(is).get("response");

	                // 결제 내역을 모델에 추가
	                model.addAttribute("paymentData", paymentData);

	                // JSP 페이지로 이동
	                return "reservation/payment_list"; // payment_list.jsp를 반환
	            }
	        } else {
	            // 응답 코드 및 메시지 로그
	            StringBuilder errorMessage = new StringBuilder("결제 내역 조회에 실패했습니다. 응답 코드: ");
	            errorMessage.append(responseCode).append(", 응답 메시지: ").append(conn.getResponseMessage());
	            System.err.println(errorMessage.toString());
	            model.addAttribute("errorMessage", errorMessage.toString());
	            return "home"; // error.jsp를 반환
	        }
	    }  catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("errorMessage", "오류 발생: " + e.getMessage());
	        return "home"; 
	    } finally {
	        if (conn != null) {
	            conn.disconnect();
	        }
	    }
	}
	
	
	

	
	
	
	
	
	
	
	

}
