package com.human.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IQaDao;
import com.human.dto.QaDto;

import com.human.vo.BoardVo;

@Service
public class QaServiceImpl implements IQaService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<QaDto> qa_listSearch(BoardVo vo) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		return dao.qa_listSearch(vo);
	}
	public int qa_listSearchCount(BoardVo vo) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		return dao.qa_listSearchCount(vo);
	}
	public void res_update(Integer qa_id,String response,Integer display) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		dao.res_update(qa_id,response,display);
	}
	public List<QaDto> qa_list(BoardVo vo,String customer_id) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		return dao.qa_list(vo,customer_id);
	}
	public int qa_listCount(String customer_id) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		return dao.qa_listCount(customer_id);
	}
}
