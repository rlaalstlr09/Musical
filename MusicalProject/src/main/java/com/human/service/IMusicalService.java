package com.human.service;

import java.util.List;

import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

public interface IMusicalService {

	public List<MusicalDto> selectAllMusical(BoardVo vo) throws Exception;
	public Integer getTotalCount() throws Exception;
}
