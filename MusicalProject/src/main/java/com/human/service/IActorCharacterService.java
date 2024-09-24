package com.human.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.human.dto.ActorCharacterDto;
import com.human.dto.CharacterDto;


public interface IActorCharacterService {
	
	public void insert(ActorCharacterDto dto) throws Exception;
	public ActorCharacterDto select(Integer actor_id) throws Exception;
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorCharacterDto dto) throws Exception;	
	
	public void actor_character_create(CharacterDto character) throws Exception;
	public void actor_character_update(ActorCharacterDto dto) throws Exception;	
}
