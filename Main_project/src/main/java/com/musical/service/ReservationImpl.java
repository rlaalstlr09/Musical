package com.musical.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.dao.IReservationDao;
import com.musical.dto.ReservationDto;

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
	public List<ReservationDto> admin_reservation_check_page_all(int page, int pagenum) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_page_all(page, pagenum);
	}	
	@Override
	public int admin_reservation_check_total_all() throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_total_all();
	}
	
	@Override
	public List<ReservationDto> admin_reservation_check_page(int status, int page, int pagenum) throws Exception {
		// TODO Auto-generated method stub
		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_page(status, page, pagenum);
	}
	@Override
	public int admin_reservation_check_total(int status) throws Exception {
		// TODO Auto-generated method stub

		IReservationDao dao=sqlSession.getMapper(IReservationDao.class);
		return dao.admin_reservation_check_total(status);
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





}
