package com.human.service;

import java.util.List;

import com.human.dto.VenueDto;
import com.human.vo.BoardVo;

public interface IVenueService {

	public List<VenueDto> venue_list() throws Exception;
	public String venue_name(int venue_id) throws Exception;
	
	//admin관련
	public void venue_create(VenueDto venue) throws Exception;
	public void venue_update(VenueDto venue) throws Exception;
	public void venue_delete(Integer venue_id) throws Exception;
	public List<VenueDto> venue_listSearch(BoardVo vo) throws Exception;
	public int venue_listSearchCount(BoardVo vo) throws Exception;
	public VenueDto venue_read(Integer venue_id) throws Exception;
}
