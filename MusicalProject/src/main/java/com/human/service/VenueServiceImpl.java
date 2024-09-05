package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IVenueDao;
import com.human.dto.VenueDto;
import com.human.vo.BoardVo;

@Service
public class VenueServiceImpl implements IVenueService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<VenueDto> venue_list() throws Exception {
		// TODO Auto-generated method stub
		IVenueDao dao=sqlSession.getMapper(IVenueDao.class);
		return dao.venue_list();
	}
	@Override
	public String venue_name(int venue_id) throws Exception {
		// TODO Auto-generated method stub
		IVenueDao dao=sqlSession.getMapper(IVenueDao.class);
		return dao.venue_name(venue_id);
	}
	
	//admin 작업
	public void venue_create(VenueDto venue) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		dao.venue_create(venue);
	}
	public void venue_update(VenueDto venue) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		dao.venue_update(venue);
	}
	public void venue_delete(Integer venue_id) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		dao.venue_delete(venue_id);
	}
	public List<VenueDto> venue_listSearch(BoardVo vo) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		return dao.venue_listSearch(vo);
	}
	public int venue_listSearchCount(BoardVo vo) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		return dao.venue_listSearchCount(vo);
	}
	public VenueDto venue_read(Integer venue_id) throws Exception{
		IVenueDao dao = sqlSession.getMapper(IVenueDao.class);
		return dao.venue_read(venue_id);		
	}


}
