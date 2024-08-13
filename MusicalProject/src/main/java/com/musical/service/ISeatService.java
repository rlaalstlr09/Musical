package com.musical.service;

import java.util.List;

import com.musical.dto.SeatDto;

public interface ISeatService {

	public List<SeatDto> seat_select(int mu_sch_id) throws Exception;
	public void seat_reservation(int seat_id,int reservation_id) throws Exception;
	public List<SeatDto> seat_reservation_check(int reservation_id) throws Exception;
	public void seat_cancel(int reservation_id) throws Exception;
	public int seat_count(int mu_sch_id) throws Exception;
}
