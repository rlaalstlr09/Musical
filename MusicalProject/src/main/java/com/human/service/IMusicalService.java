package com.human.service;

import java.util.List;

import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.vo.BoardVo;

public interface IMusicalService {
	public List<MusicalDto> selectAllMusical(BoardVo vo, String keyword, String sort, MusicalFilterDto filter) throws Exception;
	public MusicalDto selectMusicalId(Integer musical_id) throws Exception;
	public Integer getTotalCount(String keyword, MusicalFilterDto filter) throws Exception;
	
	public List<MusicalScheduleDto> selectMusicalSchedule(Integer musical_id) throws Exception;
	
	public Integer selectMusicalLike(Integer musical_id, String customer_id) throws Exception;
	public void insertLike(Integer musical_id, String customer_id) throws Exception;
	public void deleteLike(Integer musical_id, String customer_id) throws Exception;
}
