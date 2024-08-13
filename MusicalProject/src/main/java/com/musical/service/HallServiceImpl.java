package com.musical.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.dao.IHallDao;
import com.musical.dto.HallDto;

@Service
public class HallServiceImpl implements IHallService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public HallDto select_hall(int hall_id) throws Exception {
		// TODO Auto-generated method stub

		IHallDao dao=sqlSession.getMapper(IHallDao.class);
		return dao.select_hall(hall_id);
	}



}
