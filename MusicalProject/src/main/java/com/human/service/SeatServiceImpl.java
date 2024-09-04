package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.ISeatDao;
import com.human.dto.SeatDto;

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

	@Override
	public int seat_create_seq() throws Exception {
		// TODO Auto-generated method stub
		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		return dao.seat_create_seq();
	}
	
	@Override
	public void manage_seats(SeatDto seatdto) throws Exception{
		ISeatDao dao=sqlSession.getMapper(ISeatDao.class);
		dao.manage_seats(seatdto);
	}	
	@Override
	public List<SeatDto> selectSeatInfo(Integer musical_id) throws Exception {
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);		
		return dao.selectSeatInfo(musical_id);
	}
	@Override
	public int seat_check(int seat_id) throws Exception {
		// TODO Auto-generated method stub
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);
		return dao.seat_check(seat_id);
	}
	
	//admin작업
	public void seat_Alldelete(Integer musical_id) throws Exception{
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);
		dao.seat_Alldelete(musical_id);		
	}
	public void seat_venueAlldelete(Integer venue_id) throws Exception{
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);
		dao.seat_venueAlldelete(venue_id);		
	}
	public void seat_hallAlldelete(Integer hall_id) throws Exception{
		ISeatDao dao = sqlSession.getMapper(ISeatDao.class);
		dao.seat_hallAlldelete(hall_id);		
	}


}
