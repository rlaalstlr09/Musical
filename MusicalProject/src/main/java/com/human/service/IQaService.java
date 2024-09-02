package com.human.service;

import java.util.List;




import com.human.dto.QaDto;

import com.human.vo.BoardVo;

public interface IQaService {
	
	public List<QaDto> qa_listSearch(BoardVo vo) throws Exception;
	public int qa_listSearchCount(BoardVo vo) throws Exception;
	public void res_update(Integer qa_id,String response,Integer display) throws Exception;
	public List<QaDto> qa_list(BoardVo vo,String customer_id) throws Exception;
	public int qa_listCount(String customer_id) throws Exception;
}
