package com.musical.dao;

import java.util.List;

import com.musical.dto.VenueDto;

public interface IVenueDao {
	public List<VenueDto> venue_list() throws Exception;

}
