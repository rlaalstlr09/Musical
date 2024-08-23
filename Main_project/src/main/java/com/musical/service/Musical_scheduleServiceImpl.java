package com.musical.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.dao.IMusical_scheduleDao;
import com.musical.dto.Musical_scheduleDto;

@Service
public class Musical_scheduleServiceImpl implements IMusical_scheduleService{

	@Autowired
	private SqlSession sqlSession;
	@Override

	public List<Musical_scheduleDto> select_Musical_sch(String mu_sch_date,int venue_id,int musical_id) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		return dao.select_Musical_sch(mu_sch_date, venue_id,musical_id);
	}
	@Override
	public void mu_sch_seat_update(String seat_count, int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		dao.mu_sch_seat_update(seat_count, mu_sch_id);
		
	}
	@Override
	public void insert_mu_sch(Musical_scheduleDto mu_schdto) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		dao.insert_mu_sch(mu_schdto);
	}
	@Override
	public Musical_scheduleDto mu_sch_info(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		return dao.mu_sch_info(mu_sch_id);
	}
	@Override
	public Musical_scheduleDto select_mu_sch_id(int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		return dao.select_mu_sch_id(mu_sch_id);
	}
	@Override
	public void mu_sch_update(Musical_scheduleDto mu_sch_dto) throws Exception {
		// TODO Auto-generated method stub
		IMusical_scheduleDao dao=sqlSession.getMapper(IMusical_scheduleDao.class);
		dao.mu_sch_update(mu_sch_dto);
		
	}

}
