package com.human.dao;

import java.util.List;

import com.human.dto.SeatDto;

public interface ISeatDao {
	public List<SeatDto> selectSeatInfo(Integer musical_id) throws Exception;
}
