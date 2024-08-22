package com.human.service;

import java.util.List;

import com.human.dto.SeatDto;

public interface ISeatService {
	public List<SeatDto> selectSeatInfo(Integer musical_id) throws Exception;
}
