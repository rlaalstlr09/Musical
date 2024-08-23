package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IReservationDao;
import com.human.dto.ReservationDto;

@Service
public class ReservationImpl implements IReservationService{

	@Autowired
	private SqlSession sqlSession;



	@Override
	public List<ReservationDto> reservation_select(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_select(mu_sch_id);
	}

	@Override
	public void reservation_insert(ReservationDto reservationdto) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		dao.reservation_insert(reservationdto);
	}

	@Override
	public int reser_seq() throws Exception {
		// TODO Auto-generated method stub

		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reser_seq();
	}

	@Override
	public List<ReservationDto> reservation_check(String customer_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_check(customer_id);
	}

	@Override
	public void reservation_cancel(int reservation_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		dao.reservation_cancel(reservation_id);
		
		
	}

}
