package com.musical.dao;

import java.util.List;

import com.musical.dto.ReservationDto;

public interface IReservationDao {
	public List<ReservationDto> reservation_select(int mu_sch_id) throws Exception;
	public List<ReservationDto> reservation_check(String customer_id) throws Exception;
	public void reservation_insert(ReservationDto reservationdto) throws Exception;
	public void reservation_cancel(int reservation_id) throws Exception;
	public int reser_seq() throws Exception;
}