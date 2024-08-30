package com.human.dao;

import java.util.List;

import com.human.dto.NoticeDto;
import com.human.vo.BoardVo;

public interface INoticeDao {
	public void create(NoticeDto notice) throws Exception;

	public NoticeDto read(Integer nId) throws Exception;

	public void update(NoticeDto notice) throws Exception;

	public void delete(Integer nId) throws Exception;

	public List<NoticeDto> listSearch(BoardVo vo) throws Exception;

	public int listSearchCount(BoardVo vo) throws Exception;	
	
	
	public void nHitUpdate(int nId) throws Exception;
}
