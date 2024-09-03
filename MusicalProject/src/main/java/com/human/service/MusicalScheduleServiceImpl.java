package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IMusicalScheduleDao;
import com.human.dto.MusicalScheduleDto;

@Service
public class MusicalScheduleServiceImpl implements IMusicalScheduleService{

	@Autowired
	private SqlSession sqlSession;
	@Override

	public List<MusicalScheduleDto> select_Musical_sch(String mu_sch_date,int venue_id,int musical_id) throws Exception {
		// TODO Auto-generated method stub
		IMusicalScheduleDao dao=sqlSession.getMapper(IMusicalScheduleDao.class);
		return dao.select_Musical_sch(mu_sch_date, venue_id,musical_id);
	}
	@Override
	public void mu_sch_seat_update(String seat_count, int mu_sch_id) throws Exception {
		// TODO Auto-generated method stub
		IMusicalScheduleDao dao=sqlSession.getMapper(IMusicalScheduleDao.class);
		dao.mu_sch_seat_update(seat_count, mu_sch_id);
		
	}
	@Override
	public void insert_mu_sch(MusicalScheduleDto mu_schdto) throws Exception {
		// TODO Auto-generated method stub
		IMusicalScheduleDao dao=sqlSession.getMapper(IMusicalScheduleDao.class);
		dao.insert_mu_sch(mu_schdto);
	}
	
	//admin 삭제 관련
	public void musical_schedule_Alldelete(Integer musical_id) throws Exception{
		IMusicalScheduleDao dao = sqlSession.getMapper(IMusicalScheduleDao.class);
		dao.musical_schedule_Alldelete(musical_id);		
	}
	public void musical_schedule_venuedelete(Integer venue_id) throws Exception{
		IMusicalScheduleDao dao = sqlSession.getMapper(IMusicalScheduleDao.class);
		dao.musical_schedule_Alldelete(venue_id);		
	}
	public void musical_schedule_halldelete(Integer hall_id) throws Exception{
		IMusicalScheduleDao dao = sqlSession.getMapper(IMusicalScheduleDao.class);
		dao.musical_schedule_halldelete(hall_id);		
	}
}
