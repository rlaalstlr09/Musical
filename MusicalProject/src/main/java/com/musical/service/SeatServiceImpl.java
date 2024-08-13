package com.musical.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.dao.ISeatDao;
import com.musical.dto.SeatDto;

@Service
public class SeatServiceImpl implements ISeatService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SeatDto> seat_select(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		return dao.seat_select(mu_sch_id);
	}

	@Override
	public void seat_reservation(int seat_id,int reservation_id) throws Exception {
		// TODO Auto-generated method stub

		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		dao.seat_reservation(seat_id,reservation_id);
		
	}

	@Override
	public List<SeatDto> seat_reservation_check(int reservation_id) throws Exception {
		// TODO Auto-generated method stub
		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		return dao.seat_reservation_check(reservation_id);
	}

	@Override
	public void seat_cancel(int reservation_id) throws Exception {
		// TODO Auto-generated method stub

		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		dao.seat_cancel(reservation_id);
	}

	@Override
	public int seat_count(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub

		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		return dao.seat_count(mu_sch_id);
	}

}
