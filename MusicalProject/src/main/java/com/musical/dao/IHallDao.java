package com.musical.dao;

import java.util.List;

import com.musical.dto.HallDto;

public interface IHallDao {
	public HallDto select_hall(int hall_id) throws Exception;
	public List<HallDto> hall_list_venue(int venue_id) throws Exception;

}