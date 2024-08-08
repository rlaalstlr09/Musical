package com.human.dao;

import java.util.List;

import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

public interface IMusicalDao {
	public List<MusicalDto> selectAllMusical(BoardVo vo) throws Exception;
	
	public Integer getTotalCount() throws Exception;
}
