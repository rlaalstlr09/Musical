package com.human.service;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IQaDao;
import com.human.dao.IReviewDao;
import com.human.dto.CustomerDto;
import com.human.dto.QaDto;
import com.human.dto.ReviewDto;
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
	
	// 추가한 부분
	public void write(QaDto board) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		dao.create(board);
	}
	public void deleteAll(CustomerDto dto) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		dao.deleteAll(dto);
	}
	//qna
	public void insertQna(QaDto dto) throws Exception{
		IQaDao dao = sqlSession.getMapper(IQaDao.class);
		dao.insertQna(dto);
	}
	
	@Override
	public ArrayList<QaDto> selectAllQna(Integer musical_id,BoardVo vo) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		return dao.selectAllQna(musical_id,vo);
	}
	
	@Override
	public ArrayList<QaDto> selectMyQna(String customer_id,BoardVo vo) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		return dao.selectMyQna(customer_id,vo);
	}
	
	@Override
	public void deleteQna(int qa_id) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		dao.deleteQna(qa_id);
		
	}
	
	@Override
	public void all_delete(String customer_id) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		dao.all_delete(customer_id);
		
	}

	@Override
	public void updateQna(QaDto dto) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		dao.updateQna(dto);
		
	}
	
	@Override
	public Integer totalCount(Integer musical_id) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		
		return dao.totalCount(musical_id);
	}
	
	@Override
	public Integer myTotalCount(String customer_id) throws Exception {
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		
		return dao.myTotalCount(customer_id);
	}
	
	@Override
	public void adResponse(int qa_id,String response)throws Exception{
		IQaDao dao=sqlSession.getMapper(IQaDao.class);
		dao.adResponse(qa_id, response);
		
	}
	
}
