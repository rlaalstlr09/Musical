package com.human.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IReviewDao;
import com.human.dto.ReviewDto;
import com.human.vo.BoardVo;
@Service
public class ReviewServiceImpl implements IReviewService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ReviewDto dto) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		dao.insert(dto);		
	}
	@Override
	public ReviewDto select(String customer_id) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		return dao.select(customer_id);
	}

	@Override
	public ArrayList<ReviewDto> selectAll(Integer musical_id,BoardVo vo) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		return dao.selectAll(musical_id,vo);
	}
	
	@Override
	public ArrayList<ReviewDto> selectMyReview(String customer_id,BoardVo vo) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		return dao.selectMyReview(customer_id,vo);
	}
	
	@Override
	public void delete(int review_id) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		dao.delete(review_id);
		
	}

	@Override
	public void update(ReviewDto dto) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		dao.update(dto);
		
	}
	
	@Override
	public Integer totalCount(Integer musical_id,String customer_id) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		dao.totalCount(musical_id,customer_id);
		return dao.totalCount(musical_id,customer_id);
	}
	
	@Override
	public Double avgRating(Integer musical_id) throws Exception {
		IReviewDao dao=sqlSession.getMapper(IReviewDao.class);
		dao.avgRating(musical_id);
		return dao.avgRating(musical_id);
	}

}
