package com.human.dto;

public class HallDto {
	private int hall_id;
	private String hall_name;
	private int hall_total_seat;
	private int venue_id;
	
	public HallDto() {}
	public HallDto(int hall_id, String hall_name, int hall_total_seat, int venue_id) {
		super();
		this.hall_id = hall_id;
		this.hall_name = hall_name;
		this.hall_total_seat = hall_total_seat;
		this.venue_id = venue_id;
	}
	public int getHall_id() {
		return hall_id;
	}
	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public int getHall_total_seat() {
		return hall_total_seat;
	}
	public void setHall_total_seat(int hall_total_seat) {
		this.hall_total_seat = hall_total_seat;
	}
	public int getVenue_id() {
		return venue_id;
	}
	public void setVenue_id(int venue_id) {
		this.venue_id = venue_id;
	}
	@Override
	public String toString() {
		return "HallDto [hall_id=" + hall_id + ", hall_name=" + hall_name + ", hall_total_seat=" + hall_total_seat
				+ ", venue_id=" + venue_id + "]";
	}
	
	
	
	
}
