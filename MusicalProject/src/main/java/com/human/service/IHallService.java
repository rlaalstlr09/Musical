package com.human.service;

import java.util.List;

import com.human.dto.HallDto;

public interface IHallService {

	public HallDto select_hall(int hall_id) throws Exception;
	public List<HallDto> hall_list_venue(int venue_id) throws Exception;


}
