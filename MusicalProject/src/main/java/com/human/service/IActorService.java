package com.human.service;

import java.util.ArrayList;


import com.human.dto.ActorDto;


public interface IActorService {
	
	public void insert(ActorDto dto) throws Exception;
	public ActorDto select(int actor_id) throws Exception;
	public ArrayList<ActorDto> selectAll() throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorDto dto) throws Exception;	
	

}
