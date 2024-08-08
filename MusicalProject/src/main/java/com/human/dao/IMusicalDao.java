package com.human.dao;

import java.util.List;

import com.human.dto.MusicalDto;

public interface IMusicalDao {
	public List <MusicalDto> selectAllMusical() throws Exception;
}
