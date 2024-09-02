package com.human.dao;

import java.util.List;

import com.human.dto.FaqDto;
import com.human.vo.BoardVo;

public interface IFaqDao {
	public void create(FaqDto faq) throws Exception;

	public FaqDto read(Integer fId) throws Exception;

	public void update(FaqDto faq) throws Exception;

	public void delete(Integer fId) throws Exception;


	public List<FaqDto> listSearch(BoardVo vo) throws Exception;

	public int listSearchCount(BoardVo vo) throws Exception;
	
}
