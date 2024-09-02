package com.human.dto;

public class Venue_apiDto {
	double x;
	double y;
	int venue_id;
	String venue_name;
	String venue_address;
	
	
	
	@Override
	public String toString() {
		return "Venue_apiDto [x=" + x + ", y=" + y + ", venue_id=" + venue_id + ", venue_name=" + venue_name
				+ ", venue_address=" + venue_address + "]";
	}

	public Venue_apiDto() {}
	
	public Venue_apiDto(double x, double y, int venue_id, String venue_name, String venue_address) {
		super();
		this.x = x;
		this.y = y;
		this.venue_id = venue_id;
		this.venue_name = venue_name;
		this.venue_address = venue_address;
	}



	public Venue_apiDto(double x, double y, int venue_id) {
		super();
		this.x = x;
		this.y = y;
		this.venue_id = venue_id;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
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
	
	
}
