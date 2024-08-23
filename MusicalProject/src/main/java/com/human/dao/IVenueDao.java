package com.human.dao;

import java.util.List;

import com.human.dto.VenueDto;

public interface IVenueDao {
	public List<VenueDto> venue_list() throws Exception;

}
