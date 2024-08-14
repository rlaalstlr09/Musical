package com.musical.service;

import java.util.List;

import com.musical.dto.VenueDto;

public interface IVenueService {

	public List<VenueDto> venue_list() throws Exception;
}
