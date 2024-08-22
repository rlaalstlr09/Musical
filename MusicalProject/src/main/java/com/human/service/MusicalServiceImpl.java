package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IMusicalDao;
import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.vo.BoardVo;

@Service
public class MusicalServiceImpl implements IMusicalService {

	@Autowired
	private SqlSession sqlSession;

	//뮤지컬 리스트 페이지 정렬기준, 필터, 검색 키워드를 통해 조건에 맞는 뮤지컬 목록 불러옴
	@Override
	public List<MusicalDto> selectAllMusical(BoardVo vo, String keyword, String sort, MusicalFilterDto filter) throws Exception {
		
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		
		return dao.selectAllMusical(vo, keyword, sort, filter);
	}
	
	
	//뮤지컬 상세보기 페이지 유저가 클릭한 뮤지컬 id를 통해 뮤지컬 정보 불러옴
	@Override
	public MusicalDto selectMusicalId(Integer musical_id) throws Exception {
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		
		return dao.selectMusicalId(musical_id);
	}

	//뮤지컬 리스트 페이지 페이지 갯수 구하기 위한 sql문
	@Override
	public Integer getTotalCount(String keyword, MusicalFilterDto filter) throws Exception {
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		
		return dao.getTotalCount(keyword, filter);
	}
	
	//뮤지컬 상세보기 페이지 뮤지컬 일정표 출력을 위한 sql문
	@Override
	public List<MusicalScheduleDto> selectMusicalSchedule(Integer musical_id) throws Exception {
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		return dao.selectMusicalSchedule(musical_id);
	}


	@Override
	public Integer selectMusicalLike(Integer musical_id, String customer_id) throws Exception {
		
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		return dao.selectMusicalLike(musical_id, customer_id);
	}


	@Override
	public void insertLike(Integer musical_id, String customer_id) throws Exception {
		
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		dao.insertLike(musical_id, customer_id);
		
	}


	@Override
	public void deleteLike(Integer musical_id, String customer_id) throws Exception {
		// TODO Auto-generated method stub
		
		IMusicalDao dao = sqlSession.getMapper(IMusicalDao.class);
		dao.deleteLike(musical_id, customer_id);
	}
	
	
}
