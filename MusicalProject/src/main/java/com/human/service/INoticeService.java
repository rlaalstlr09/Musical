package com.human.service;

import java.util.List;

import com.human.dto.FaqDto;
import com.human.dto.NoticeDto;
import com.human.vo.BoardVo;

public interface INoticeService {
	public void create(NoticeDto notice) throws Exception;

	public NoticeDto read(Integer nId) throws Exception;

	public void update(NoticeDto notice) throws Exception;

	public void delete(Integer nId) throws Exception;


	public List<NoticeDto> listSearch(BoardVo vo) throws Exception;

	public int listSearchCount(BoardVo vo) throws Exception;
	
	
	public void nHitUpdate(int nId) throws Exception;
}
