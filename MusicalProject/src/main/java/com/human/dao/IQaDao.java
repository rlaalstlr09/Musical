package com.human.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.CustomerDto;
import com.human.dto.QaDto;

import com.human.vo.BoardVo;

public interface IQaDao {
	
	public List<QaDto> qa_listSearch(BoardVo vo) throws Exception;
	public int qa_listSearchCount(BoardVo vo) throws Exception;
	public void res_update(@Param("qa_id") Integer qa_id, @Param("response") String response, @Param("display") Integer display) throws Exception;
	public List<QaDto> qa_list(@Param("vo") BoardVo vo,@Param("customer_id") String customer_id) throws Exception;
	public int qa_listCount(String customer_id) throws Exception;
	
	//추가한 부분
	public void create(QaDto dtos) throws Exception; //1:1문의 글쓰기
	public void deleteAll(CustomerDto dto) throws Exception; //회원 탈퇴시 삭제용
}
