package com.human.service;

import java.util.ArrayList;
import java.util.List;

import com.human.dto.ReviewDto;
import com.human.vo.BoardVo;


public interface IReviewService {
	
	public void insert(ReviewDto dto) throws Exception;
	public ReviewDto select(String customer_id) throws Exception;
	public ArrayList<ReviewDto> selectAll(Integer musical_id,BoardVo vo) throws Exception;
	public ArrayList<ReviewDto> selectMyReview(String customer_id,BoardVo vo) throws Exception;
	public void delete(int review_id) throws Exception;
	public void update(ReviewDto dto) throws Exception;	
	public Integer totalCount(Integer musical_id,String customer_id) throws Exception;
	public Double avgRating(Integer musical_id) throws Exception;

}
