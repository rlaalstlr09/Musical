package com.musical.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musical.dto.ReservationDto;

public interface IReservationDao {
	public List<ReservationDto> reservation_select(int mu_sch_id) throws Exception;
	public List<ReservationDto> reservation_check(String customer_id) throws Exception;
	public void reservation_insert(ReservationDto reservationdto) throws Exception;
	public ReservationDto reservation_id(int reservation_id) throws Exception;
	public List<ReservationDto> reservation_mu_sch_id(int mu_sch_id) throws Exception;
	public void reservation_cancel(int reservation_id) throws Exception;
	public String id_check(int reservation_id) throws Exception;
	public int reser_seq() throws Exception;
	
	
	
	
	
	
	
	
	
	public List<ReservationDto> reservation_check_page(String customer_id,int page,int pagenum) throws Exception;
	public int reservation_check_total(String customer_id) throws Exception;
	
	public List<ReservationDto> reservation_range(String customer_id,int page,int pagenum,String startDate,String endDate) throws Exception;
	public int total_reservation_range(String customer_id,String startDate,String endDate) throws Exception;

	
    public List<ReservationDto> admin_reservation_check_page_all(
            @Param("status") int status,
            @Param("page") int page,
            @Param("pagenum") int pagenum
        ) throws Exception;
    public List<ReservationDto> admin_reservation_check_page(
            @Param("startDate") String startDate,
            @Param("endDate") String endDate,
            @Param("status") int status,
            @Param("page") int page,
            @Param("pagenum") int pagenum
        ) throws Exception;

    public int admin_reservation_check_total_all(@Param("status") int status) throws Exception;
    public int admin_reservation_check_total(            
            @Param("startDate") String startDate,
            @Param("endDate") String endDate,
            @Param("status") int status
        ) throws Exception;

	
}




