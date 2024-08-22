package com.human.dto;

public class SeatDto {
	private String seat_grade;
	private Integer seat_price;
	
	public SeatDto() {}
	
	public SeatDto(String seat_grade, Integer seat_price) {
		super();
		this.seat_grade = seat_grade;
		this.seat_price = seat_price;
	}
	
	public String getSeat_grade() {
		return seat_grade;
	}
	public void setSeat_grade(String seat_grade) {
		this.seat_grade = seat_grade;
	}
	public Integer getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(Integer seat_price) {
		this.seat_price = seat_price;
	}
	
	
}
