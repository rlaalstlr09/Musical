package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.ISeatDao;
import com.human.dto.SeatDto;

@Service
public class SeatServiceImpl implements ISeatService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SeatDto> selectSeatInfo(Integer musical_id) throws Exception {
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);
		
		return dao.selectSeatInfo(musical_id);
	}

	

}
