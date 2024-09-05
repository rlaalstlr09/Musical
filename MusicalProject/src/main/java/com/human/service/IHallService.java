package com.human.service;

import java.util.List;

import com.human.dto.HallDto;
import com.human.vo.BoardVo;

public interface IHallService {

	public HallDto select_hall(int hall_id) throws Exception;
	public List<HallDto> hall_list_venue(int venue_id) throws Exception;

	//admin관련
	public void hall_create(HallDto hall) throws Exception;
	public HallDto hall_read(Integer hall_id) throws Exception;
	public void hall_update(HallDto hall) throws Exception;
	public void hall_delete(Integer hall_id) throws Exception;
	public void hall_vanuedelete(Integer vanue_id) throws Exception;
	public List<HallDto> hall_listSearch(BoardVo vo) throws Exception;
	public int hall_listSearchCount(BoardVo vo) throws Exception;	
}
