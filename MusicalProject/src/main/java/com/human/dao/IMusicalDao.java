package com.human.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.MusicalDto;
import com.human.dto.MusicalFilterDto;
import com.human.dto.MusicalScheduleDto;
import com.human.vo.BoardVo;

public interface IMusicalDao {
	public List<MusicalDto> selectAllMusical(@Param("vo") BoardVo vo, @Param("keyword") String keyword, @Param("sort") String sort, @Param("filter") MusicalFilterDto filter) throws Exception;
	public MusicalDto selectMusicalId(Integer musical_id) throws Exception;
	public Integer getTotalCount(@Param("keyword") String keyword, @Param("filter") MusicalFilterDto filter) throws Exception;

	public List<MusicalScheduleDto> selectMusicalSchedule(Integer musical_id) throws Exception;
	
	public boolean selectMusicalLike(Integer musical_id, String customer_id) throws Exception;
	public void insertLike(Integer musical_id, String customer_id) throws Exception;
	public void deleteLike(Integer musical_id, String customer_id) throws Exception;
}
