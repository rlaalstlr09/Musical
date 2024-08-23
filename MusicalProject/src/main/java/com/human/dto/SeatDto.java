package com.human.dto;

public class SeatDto {
	private int seat_id;
	private int hall_id;
	private int mu_sch_id;
	private int musical_id;
	private String seat_grade;
	private String seat_name;
	private int seat_row;
	private int seat_col;
	private int seat_reservation;
	private int seat_price;
	
	public SeatDto() {
		
	}
	public SeatDto(int seat_id, int hall_id, int mu_sch_id, int musical_id, String seat_grade, String seat_name,
			int seat_row, int seat_col, int seat_reservation, int seat_price) {
		super();
		this.seat_id = seat_id;
		this.hall_id = hall_id;
		this.mu_sch_id = mu_sch_id;
		this.musical_id = musical_id;
		this.seat_grade = seat_grade;
		this.seat_name = seat_name;
		this.seat_row = seat_row;
		this.seat_col = seat_col;
		this.seat_reservation = seat_reservation;
		this.seat_price = seat_price;
	}
	
//	public SeatDto(String seat_grade, Integer seat_price) {
//		super();
//		this.seat_grade = seat_grade;
//		this.seat_price = seat_price;
//	}
//	
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getHall_id() {
		return hall_id;
	}
	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
	public int getMu_sch_id() {
		return mu_sch_id;
	}
	public void setMu_sch_id(int mu_sch_id) {
		this.mu_sch_id = mu_sch_id;
	}
	public int getMusical_id() {
		return musical_id;
	}
	public void setMusical_id(int musical_id) {
		this.musical_id = musical_id;
	}
	public String getSeat_grade() {
		return seat_grade;
	}
	public void setSeat_grade(String seat_grade) {
		this.seat_grade = seat_grade;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public int getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}
	public int getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}
	public int getSeat_reservation() {
		return seat_reservation;
	}
	public void setSeat_reservation(int seat_reservation) {
		this.seat_reservation = seat_reservation;
	}
	public int getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(int seat_price) {
		this.seat_price = seat_price;
	}
	@Override
	public String toString() {
		return "SeatDto [seat_id=" + seat_id + ", hall_id=" + hall_id + ", mu_sch_id=" + mu_sch_id + ", musical_id="
				+ musical_id + ", seat_grade=" + seat_grade + ", seat_name=" + seat_name + ", seat_row=" + seat_row
				+ ", seat_col=" + seat_col + ", seat_reservation=" + seat_reservation + ", seat_price=" + seat_price
				+ "]";
	}
	
	
	
}
