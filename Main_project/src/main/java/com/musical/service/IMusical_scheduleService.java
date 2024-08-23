package com.musical.service;

import java.util.List;

import com.musical.dto.Musical_scheduleDto;

public interface IMusical_scheduleService {


	public List<Musical_scheduleDto> select_Musical_sch(String mu_sch_date,int venue_id,int musical_id) throws Exception;
	public void mu_sch_seat_update(String seat_count , int mu_sch_id) throws Exception;
	public void insert_mu_sch(Musical_scheduleDto mu_schdto) throws Exception;

	public Musical_scheduleDto	select_mu_sch_id(int mu_sch_id) throws Exception;

	public Musical_scheduleDto mu_sch_info(int mu_sch_id) throws Exception;
	public void mu_sch_update(Musical_scheduleDto mu_sch_dto) throws Exception;
}
