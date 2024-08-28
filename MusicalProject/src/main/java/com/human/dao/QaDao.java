package com.human.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.CustomerDto;
import com.human.dto.QaDto;
import com.human.vo.BoardVo;

public interface QaDao {
	  public void create(QaDto vo) throws Exception;
	  
	  public QaDto read(int qa_id) throws Exception;

	  public void update(QaDto vo) throws Exception;

//	  public void delete(int qa_id) throws Exception;
	  
	  public void deleteAll(CustomerDto dto) throws Exception;

	  public List<QaDto> qa_list(@Param("vo") BoardVo vo, @Param("customer_id")String customer_id) throws Exception;
	  
	  public int qa_listCount(String customer_id) throws Exception;
	  
//	  public List<BoardDTO> listSearch(BoardVo pm)throws Exception;
//	  
//	  public int listSearchCount(BoardVo pm)throws Exception;

}
