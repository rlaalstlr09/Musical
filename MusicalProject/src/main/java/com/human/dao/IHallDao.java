package com.human.dao;

import java.util.List;

import com.human.dto.HallDto;

public interface IHallDao {
	public HallDto select_hall(int hall_id) throws Exception;
	public List<HallDto> hall_list_venue(int venue_id) throws Exception;

}