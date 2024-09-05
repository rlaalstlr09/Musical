package com.human.dao;

import java.util.List;

import com.human.dto.MusicalScheduleDto;

public interface IMusicalScheduleDao {
	public List<MusicalScheduleDto> select_Musical_sch(String mu_sch_date,int venue_id,int musical_id) throws Exception;
	public void mu_sch_seat_update(String seat_count , int mu_sch_id) throws Exception;
	public void insert_mu_sch(MusicalScheduleDto mu_schdto) throws Exception;
	public MusicalScheduleDto	select_mu_sch_id(int mu_sch_id) throws Exception;
	public MusicalScheduleDto mu_sch_info(int mu_sch_id) throws Exception;	
	public void mu_sch_update(MusicalScheduleDto mu_sch_dto) throws Exception;
	
	//admin관련
	public void musical_schedule_Alldelete(Integer musical_id) throws Exception;
	public void musical_schedule_venuedelete(Integer venue_id) throws Exception;
	public void musical_schedule_halldelete(Integer hall_id) throws Exception;
}
