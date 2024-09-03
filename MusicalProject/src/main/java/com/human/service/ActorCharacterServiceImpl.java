package com.human.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IActorCharacterDao;

import com.human.dto.ActorCharacterDto;

@Service
public class ActorCharacterServiceImpl implements IActorCharacterService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ActorCharacterDto dto) throws Exception {
		IActorCharacterDao dao=sqlSession.getMapper(IActorCharacterDao.class);
		dao.insert(dto);		
	}
	@Override
	public ActorCharacterDto select(Integer actor_id) throws Exception {
		IActorCharacterDao dao=sqlSession.getMapper(IActorCharacterDao.class);
		return dao.select(actor_id);
	}

	@Override
	public ArrayList<ActorCharacterDto> selectAll(Integer musical_id) throws Exception {
		IActorCharacterDao dao=sqlSession.getMapper(IActorCharacterDao.class);
		return dao.selectAll(musical_id);
	}

	@Override
	public void delete(int actor_id) throws Exception {
		IActorCharacterDao dao=sqlSession.getMapper(IActorCharacterDao.class);
		dao.delete(actor_id);
		
	}

	@Override
	public void update(ActorCharacterDto dto) throws Exception {
		IActorCharacterDao dao=sqlSession.getMapper(IActorCharacterDao.class);
		dao.update(dto);
		
	}
	
	public void actor_character_create(@Param("actor_id") Integer actor_id,@Param("character_id") Integer character_id) throws Exception{
		IActorCharacterDao dao = sqlSession.getMapper(IActorCharacterDao.class);
		dao.actor_character_create(actor_id,character_id);
	}
	

}
