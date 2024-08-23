package com.human.service;

import java.util.List;

import com.human.dto.VenueDto;

public interface IVenueService {

	public List<VenueDto> venue_list() throws Exception;
}
