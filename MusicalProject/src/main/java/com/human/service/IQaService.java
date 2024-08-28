package com.human.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.CustomerDto;
import com.human.dto.QaDto;
import com.human.vo.BoardVo;

public interface IQaService {
	
	public void write(QaDto board) throws Exception;
	
	public QaDto read(int qa_id) throws Exception;
	
	public void modify(QaDto board) throws Exception;
	
	public List<QaDto> qa_list(@Param("vo") BoardVo vo, @Param("customer_id") String customer_id) throws Exception;
	
	public int qa_listCount(String customer_id) throws Exception;
	
	public void deleteAll(CustomerDto dto) throws Exception; 
//	public List<BoardDTO> listSearchCriteria(BoardVo pm) throws Exception;
//	public int listSearchCount(BoardVo pm) throws Exception;
	
}
