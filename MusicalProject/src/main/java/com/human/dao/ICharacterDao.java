package com.human.dao;

import java.util.ArrayList;
import java.util.List;

import com.human.dto.CharacterDto;


public interface ICharacterDao {
	public void insert(CharacterDto dto) throws Exception;
	public void insertActorCharacter() throws Exception;
	public CharacterDto select(int character_id) throws Exception;
	public ArrayList<CharacterDto> selectAll() throws Exception;
	public void delete(int character_id) throws Exception;
	public void update(CharacterDto dto) throws Exception;	
	

}
