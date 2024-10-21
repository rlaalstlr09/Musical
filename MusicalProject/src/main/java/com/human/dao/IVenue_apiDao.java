package com.human.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.MusicalDto;
import com.human.dto.Venue_apiDto;

public interface IVenue_apiDao {
	public void venue_api_create(Venue_apiDto venue) throws Exception;
	public List<Venue_apiDto> getTheaters(@Param("lat") double lat,@Param("lon") double lon,@Param("distance") double distance) throws Exception;
	public void venue_api_delete(Integer venue_id) throws Exception;
	public List<MusicalDto> getTheater(Integer venue_id) throws Exception;
	public void venue_api_update(Venue_apiDto venue) throws Exception;
	public Venue_apiDto getVenue(Integer venue_id) throws Exception;
}
