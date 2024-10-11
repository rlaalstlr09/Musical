package com.human.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.CustomerDto;
import com.human.dto.QaDto;

import com.human.vo.BoardVo;

public interface IQaService {
	
	public List<QaDto> qa_listSearch(BoardVo vo) throws Exception;
	public int qa_listSearchCount(BoardVo vo) throws Exception;
	public void res_update(Integer qa_id,String response,Integer display) throws Exception;
	public List<QaDto> qa_list(BoardVo vo,String customer_id) throws Exception;
	public int qa_listCount(String customer_id) throws Exception;
	
	//추가한 부분
	public void write(QaDto board)throws Exception;
	public void deleteAll(CustomerDto dto) throws Exception;
	
	//qna
	public void insertQna(QaDto dto) throws Exception;
	public ArrayList<QaDto> selectAllQna(@Param("musical_id") Integer musical_id, @Param("vo")BoardVo vo)throws Exception;//qna목록
	public ArrayList<QaDto> selectMyQna(@Param("customer_id") String customer_id,@Param("vo")BoardVo vo) throws Exception;//나의qna
	public void updateQna(QaDto dto) throws Exception; //qna수정
	public void deleteQna(int qa_id)throws Exception;
	public void adResponse(int qa_id,String response)throws Exception;
	public void all_delete(String customer_id) throws Exception;
	
	//qna페이징관련
	public Integer totalCount(@Param("musical_id") Integer musical_id) throws Exception;
	public Integer myTotalCount(@Param("customer_id") String customer_id) throws Exception;
}
