package com.human.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.ActorCharacterDto;
import com.human.dto.CharacterDto;


public interface IActorCharacterDao {
	public void insert(ActorCharacterDto dto) throws Exception;
	public ActorCharacterDto select(Integer actor_id) throws Exception;
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception;
	public void delete(int character_id) throws Exception;
	public void update(ActorCharacterDto dto) throws Exception;	
	
	//admin관련 Actor Character join
	public void actor_character_create(CharacterDto character) throws Exception;
	public void actor_character_update(ActorCharacterDto dto) throws Exception;	
}
