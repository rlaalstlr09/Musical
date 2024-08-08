package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IMusicalDao;
import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

@Service
public class MusicalServiceImpl implements IMusicalService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MusicalDto> selectAllMusical(BoardVo vo) throws Exception {
		
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		
		List<MusicalDto> dtos = dao.selectAllMusical(vo);
		
		return dtos;
	}

	@Override
	public Integer getTotalCount() throws Exception {
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		
		return dao.getTotalCount();
	}

	
	

}
