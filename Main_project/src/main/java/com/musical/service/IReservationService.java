package com.musical.service;

import java.util.List;

import com.musical.dto.Musical_scheduleDto;
import com.musical.dto.ReservationDto;
import com.musical.dto.SeatDto;

public interface IReservationService {

	public List<ReservationDto> reservation_select(int mu_sch_id) throws Exception;
	public List<ReservationDto> reservation_check(String customer_id) throws Exception;
	public void reservation_insert(ReservationDto reservationdto) throws Exception;
	public List<ReservationDto> reservation_mu_sch_id(int mu_sch_id) throws Exception;
	public ReservationDto reservation_id(int reservation_id) throws Exception;
	public void reservation_cancel(int reservation_id) throws Exception;
	public int reser_seq() throws Exception;
	
	
	public List<ReservationDto> reservation_check_page(String customer_id,int page,int pagenum) throws Exception;
	public int reservation_check_total(String customer_id) throws Exception;
	

	public List<ReservationDto> admin_reservation_check_page_all(int page,int pagenum) throws Exception;
	public int admin_reservation_check_total_all() throws Exception;
	public List<ReservationDto> admin_reservation_check_page(int  status,int page,int pagenum) throws Exception;
	public int admin_reservation_check_total(int status) throws Exception;

}
