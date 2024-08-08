package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IMusicalDao;
import com.human.dto.MusicalDto;

@Service
public class MusicalServiceImpl implements IMusicalService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MusicalDto> selectAllMusical() throws Exception {
		
		
		return null;
	}

	
	

}
