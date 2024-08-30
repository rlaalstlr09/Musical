package com.human.dao;

import java.util.ArrayList;
import java.util.List;

import com.human.dto.ActorCharacterDto;
import com.human.dto.CharacterDto;


public interface IActorCharacterDao {
	public void insert(ActorCharacterDto dto) throws Exception;
	public ActorCharacterDto select(Integer actor_id) throws Exception;
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception;
	public void delete(int character_id) throws Exception;
	public void update(ActorCharacterDto dto) throws Exception;	
	

}
