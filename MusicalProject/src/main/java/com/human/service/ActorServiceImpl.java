package com.human.service;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IActorDao;
import com.human.dto.ActorDto;
@Service
public class ActorServiceImpl implements IActorService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ActorDto dto) throws Exception {
		IActorDao dao=sqlSession.getMapper(IActorDao.class);
		dao.insert(dto);		
	}
	@Override
	public ActorDto select(int actor_id) throws Exception {
		IActorDao dao=sqlSession.getMapper(IActorDao.class);
		return dao.select(actor_id);
	}

	@Override
	public ArrayList<ActorDto> selectAll() throws Exception {
		IActorDao dao=sqlSession.getMapper(IActorDao.class);
		return dao.selectAll();
	}

	@Override
	public void delete(int actor_id) throws Exception {
		IActorDao dao=sqlSession.getMapper(IActorDao.class);
		dao.delete(actor_id);
		
	}

	@Override
	public void update(ActorDto dto) throws Exception {
		IActorDao dao=sqlSession.getMapper(IActorDao.class);
		dao.update(dto);
		
	}
	
	

}
