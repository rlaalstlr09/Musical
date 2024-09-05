package com.human.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IActorDao;
import com.human.dto.ActorDto;
import com.human.vo.BoardVo;
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
	
	//admin관련
	public List<ActorDto> actor_listSearch(BoardVo vo) throws Exception{
		IActorDao dao = sqlSession.getMapper(IActorDao.class);
		return dao.actor_listSearch(vo);
	}
	public int actor_listSearchCount(BoardVo vo) throws Exception{
		IActorDao dao = sqlSession.getMapper(IActorDao.class);
		return dao.actor_listSearchCount(vo);
	}	
	public List<ActorDto> actor_all() throws Exception{
		IActorDao dao = sqlSession.getMapper(IActorDao.class);
		return dao.actor_all();
	}
	public ActorDto actor_read(Integer actor_id) throws Exception{
		IActorDao dao = sqlSession.getMapper(IActorDao.class);
		return dao.actor_read(actor_id);		
	}
	public void actor_create(ActorDto actor) throws Exception{
		IActorDao dao = sqlSession.getMapper(IActorDao.class);
		dao.actor_create(actor);
	}

}
