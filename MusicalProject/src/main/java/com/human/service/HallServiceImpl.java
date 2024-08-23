package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IHallDao;
import com.human.dto.HallDto;

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

	@Override
	public List<HallDto> hall_list_venue(int venue_id) throws Exception {
		// TODO Auto-generated method stub

		IHallDao dao=sqlSession.getMapper(IHallDao.class);
		return dao.hall_list_venue(venue_id);
	}



}
