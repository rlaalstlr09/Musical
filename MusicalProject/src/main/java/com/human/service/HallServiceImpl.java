package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IHallDao;
import com.human.dto.HallDto;
import com.human.vo.BoardVo;

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

	//admin관련
	public void hall_create(HallDto hall) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		dao.hall_create(hall);
	}
	public HallDto hall_read(Integer hall_id) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		return dao.hall_read(hall_id);		
	}
	public void hall_update(HallDto hall) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		dao.hall_update(hall);
	}
	public void hall_delete(Integer hall_id) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		dao.hall_delete(hall_id);
	}
	public void hall_vanuedelete(Integer vanue_id) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		dao.hall_vanuedelete(vanue_id);
	}
	public List<HallDto> hall_listSearch(BoardVo vo) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		return dao.hall_listSearch(vo);
	}
	public int hall_listSearchCount(BoardVo vo) throws Exception{
		IHallDao dao = sqlSession.getMapper(IHallDao.class);
		return dao.hall_listSearchCount(vo);
	}

}
