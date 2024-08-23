package com.musical.dao;

import java.util.List;

import com.musical.dto.MusicalDto;

public interface IMusicalDao {
	public List<MusicalDto> musical_list() throws Exception;
}
