package com.musical.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.dao.IMusicalDao;
import com.musical.dto.MusicalDto;
@Service
public class MusicalServiceImpl implements IMusicalService {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<MusicalDto> musical_list() throws Exception {
		// TODO Auto-generated method stub
		IMusicalDao dao =sqlSession.getMapper(IMusicalDao.class);
		return dao.musical_list();
	}


	@Override
	public String musical_title(int musical_id) throws Exception {
		// TODO Auto-generated method stub
		IMusicalDao dao =sqlSession.getMapper(IMusicalDao.class);
		return dao.musical_title(musical_id);
	}

}



