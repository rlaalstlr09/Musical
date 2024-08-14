package com.musical.dao;

import java.util.List;

import com.musical.dto.Musical_scheduleDto;

public interface IMusical_scheduleDao {
	public List<Musical_scheduleDto> select_Musical_sch(String mu_sch_date,int venue_id,int musical_id) throws Exception;
	public void mu_sch_seat_update(String seat_count , int mu_sch_id) throws Exception;
	public void insert_mu_sch(Musical_scheduleDto mu_schdto) throws Exception;
}
