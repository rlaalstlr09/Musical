package com.musical.service;

import java.util.List;

import com.musical.dto.MusicalDto;

public interface IMusicalService {
	public List<MusicalDto> musical_list() throws Exception;
}
