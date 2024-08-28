package com.human.dao;

import java.util.ArrayList;


import com.human.dto.ActorDto;


public interface IActorDao {
	public void insert(ActorDto dto) throws Exception;
	public ActorDto select(int actor_id) throws Exception;
	public ArrayList<ActorDto> selectAll() throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorDto dto) throws Exception;	
	

}
