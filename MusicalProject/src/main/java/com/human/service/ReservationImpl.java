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
	
	@Override
	public List<ReservationDto> reservation_check_page(String customer_id, int page, int pagenum) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_check_page(customer_id, page, pagenum);
	}

	@Override
	public int reservation_check_total(String customer_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_check_total(customer_id);
	}

	
	

	@Override
	public ReservationDto reservation_id(int reservation_id) throws Exception {
		// TODO Auto-generated method stub

		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_id(reservation_id);
		
	}

	@Override
	public List<ReservationDto> reservation_mu_sch_id(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_mu_sch_id(mu_sch_id);
	}

	@Override
	public List<ReservationDto> reservation_range(String customer_id, int page, int pagenum, String startDate,
			String endDate) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_range(customer_id, page, pagenum, startDate, endDate);
	}

	@Override
	public int total_reservation_range(String customer_id, String startDate, String endDate) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.total_reservation_range(customer_id, startDate, endDate);
	}

	
	
	@Override
	public List<ReservationDto> admin_reservation_check_page_all(int page, int pagenum, int status) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_page_all(page, pagenum, status);
	}

	@Override
	public int admin_reservation_check_total_all(int status) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_total_all(status);
	}

	@Override
	public List<ReservationDto> admin_reservation_check_page(String startDate, String endDate, int status, int page,
			int pagenum) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_page(startDate, endDate, status, page, pagenum);
	}

	@Override
	public int admin_reservation_check_total(String startDate, String endDate, int status) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_total(startDate, endDate, status);
	}

	@Override
	public String id_check(int reservation_id) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.id_check(reservation_id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//admin관련
	public List<ReservationDto> reservation_musical_check(Integer musical_id) throws Exception{
		IReservationDao dao = sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_musical_check(musical_id);		
	}
	public List<ReservationDto> reservation_venuecheck(Integer venue_id) throws Exception{
		IReservationDao dao = sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_venuecheck(venue_id);		
	}
	public List<ReservationDto> reservation_hallcheck(Integer hall_id) throws Exception{
		IReservationDao dao = sqlSession.getMapper(IReservationDao.class);
		return dao.reservation_hallcheck(hall_id);		
	}



}
