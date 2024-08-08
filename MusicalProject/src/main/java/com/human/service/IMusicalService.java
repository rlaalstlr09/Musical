package com.human.service;

import java.util.List;

import com.human.dto.MusicalDto;

public interface IMusicalService {
	public List <MusicalDto> selectAllMusical() throws Exception;
}
