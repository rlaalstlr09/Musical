package com.human.service;

import java.util.ArrayList;


import com.human.dto.ActorCharacterDto;


public interface IActorCharacterService {
	
	public void insert(ActorCharacterDto dto) throws Exception;
	public ActorCharacterDto select(Integer actor_id) throws Exception;
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorCharacterDto dto) throws Exception;	
	

}
