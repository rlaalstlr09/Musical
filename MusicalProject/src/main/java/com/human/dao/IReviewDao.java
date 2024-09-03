package com.human.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.ReviewDto;
import com.human.vo.BoardVo;


public interface IReviewDao {
	public void insert(ReviewDto dto) throws Exception;
	public ReviewDto select(String customer_id) throws Exception;
	public ArrayList<ReviewDto> selectAll(@Param("musical_id") Integer musical_id, @Param("vo")BoardVo vo) throws Exception;
	public ArrayList<ReviewDto> selectMyReview(String customer_id,BoardVo vo) throws Exception;
	public void delete(int review_id) throws Exception;
	public void update(ReviewDto dto) throws Exception;	
	public Integer totalCount(@Param("musical_id") Integer musical_id,@Param("customer_id") String customer_id) throws Exception;
	public Double avgRating(@Param("musical_id") Integer musical_id) throws Exception;
	
}
