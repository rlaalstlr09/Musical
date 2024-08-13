package com.musical.dao;

import com.musical.dto.HallDto;

public interface IHallDao {
	public HallDto select_hall(int hall_id) throws Exception;

}