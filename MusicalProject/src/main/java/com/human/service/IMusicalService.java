package com.human.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.vo.BoardVo;

public interface IMusicalService {
	public List<MusicalDto> selectAllMusical(@Param("vo") BoardVo vo, @Param("filter") MusicalFilterDto filter) throws Exception;
	public MusicalDto selectMusicalId(Integer musical_id) throws Exception;
	public Integer getTotalCount(@Param("filter") MusicalFilterDto filter) throws Exception;
	
	public List<MusicalScheduleDto> selectMusicalSchedule(Integer musical_id) throws Exception;
	
	public Integer selectMusicalLike(Integer musical_id, String customer_id) throws Exception;
	public void insertLike(Integer musical_id, String customer_id) throws Exception;
	public void deleteLike(Integer musical_id, String customer_id) throws Exception;
	
	
	
	public List<MusicalDto> musical_list() throws Exception;
	public String musical_title(int musical_id) throws Exception;
	
	//admin관련
	public void musical_create(MusicalDto musical) throws Exception;
	public MusicalDto musical_read(Integer musical_id) throws Exception;
	public void musical_update(MusicalDto musical) throws Exception;
	public void musical_delete(Integer mId) throws Exception;
	public List<MusicalDto> musical_listSearch(BoardVo vo) throws Exception;
	public List<MusicalDto> musical_listSearch_excel(BoardVo vo) throws Exception;
	public int musical_listSearchCount(BoardVo vo) throws Exception;
}
