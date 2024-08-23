package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IVenueDao;
import com.human.dto.VenueDto;

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

}
