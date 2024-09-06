package com.human.service;

import java.util.ArrayList;
import java.util.List;

import com.human.dto.ActorDto;
import com.human.vo.BoardVo;


public interface IActorService {
	
	public void insert(ActorDto dto) throws Exception;
	public ActorDto select(int actor_id) throws Exception;
	public ArrayList<ActorDto> selectAll() throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(ActorDto dto) throws Exception;	
	
	//admin관련
	public List<ActorDto> actor_listSearch(BoardVo vo) throws Exception;
	public int actor_listSearchCount(BoardVo vo) throws Exception;
	public List<ActorDto> actor_all() throws Exception;
	public ActorDto actor_read(Integer actor_id) throws Exception;
	public void actor_create(ActorDto actor) throws Exception;
}
