package com.human.dto;

public class VenueDto {
	private int venue_id;
	private String venue_name;
	private String venue_address;
	
	
	public VenueDto() {
		
	}


	public VenueDto(int venue_id, String venue_name, String venue_address) {
		super();
		this.venue_id = venue_id;
		this.venue_name = venue_name;
		this.venue_address = venue_address;
	}


	public int getVenue_id() {
		return venue_id;
	}


	public void setVenue_id(int venue_id) {
		this.venue_id = venue_id;
	}


	public String getVenue_name() {
		return venue_name;
	}


	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}


	public String getVenue_address() {
		return venue_address;
	}


	public void setVenue_address(String venue_address) {
		this.venue_address = venue_address;
	}


	@Override
	public String toString() {
		return "VenueDto [venue_id=" + venue_id + ", venue_name=" + venue_name + ", venue_address=" + venue_address
				+ "]";
	}
	
	
	
	
	
}
