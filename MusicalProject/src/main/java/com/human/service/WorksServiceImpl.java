package com.human.service;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IWorksDao;


import com.human.dto.WorksDto;

@Service
public class WorksServiceImpl implements IWorksService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(WorksDto dto) throws Exception {
		IWorksDao dao=sqlSession.getMapper(IWorksDao.class);
		dao.insert(dto);		
	}
	@Override
	public WorksDto select(Integer actor_id) throws Exception {
		IWorksDao dao=sqlSession.getMapper(IWorksDao.class);
		return dao.select(actor_id);
	}

	@Override
	public ArrayList<WorksDto> selectAll(int actor_id) throws Exception {
		IWorksDao dao=sqlSession.getMapper(IWorksDao.class);
		return dao.selectAll(actor_id);
	}

	@Override
	public void delete(int actor_id) throws Exception {
		IWorksDao dao=sqlSession.getMapper(IWorksDao.class);
		dao.delete(actor_id);
		
	}

	@Override
	public void update(WorksDto dto) throws Exception {
		IWorksDao dao=sqlSession.getMapper(IWorksDao.class);
		dao.update(dto);
		
	}
	
	

}
