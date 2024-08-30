package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IVenue_apiDao;
import com.human.dto.MusicalDto;
import com.human.dto.Venue_apiDto;

@Service
public class Venue_apiServiceImpl implements IVenue_apiService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void venue_api_create(Venue_apiDto venue) throws Exception {
		IVenue_apiDao dao = sqlSession.getMapper(IVenue_apiDao.class);
		dao.venue_api_create(venue);
	}

	@Override
	public List<Venue_apiDto> getTheaters(double lat, double lon, double distance) throws Exception {
		IVenue_apiDao dao = sqlSession.getMapper(IVenue_apiDao.class);
		return dao.getTheaters(lat,lon,distance);
	}
	
	public void venue_api_delete(Integer venue_id) throws Exception{
		IVenue_apiDao dao = sqlSession.getMapper(IVenue_apiDao.class);
		dao.venue_api_delete(venue_id);
	}
	public List<MusicalDto> getTheater(Integer venue_id) throws Exception{
		IVenue_apiDao dao = sqlSession.getMapper(IVenue_apiDao.class);
		return dao.getTheater(venue_id);
	}

}
