package com.human.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.human.dto.ActorCharacterDto;


public interface IActorCharacterService {
	
	public void insert(ActorCharacterDto dto) throws Exception;
	public ActorCharacterDto select(Integer actor_id) throws Exception;
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorCharacterDto dto) throws Exception;	
	
	public void actor_character_create(@Param("actor_id") Integer actor_id,@Param("character_id") Integer character_id) throws Exception;
}
