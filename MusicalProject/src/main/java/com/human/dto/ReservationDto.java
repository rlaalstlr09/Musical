package com.human.dto;

public class ReservationDto {
	private int reservation_id;
	private int booked_count;
	private int mu_sch_id;
	private String customer_id;
	private int total_cost;
	private int reservation_cancel;
	private String reservation_time; 
	
	public ReservationDto() {}

	public ReservationDto(int reservation_id, int booked_count, int mu_sch_id, String customer_id, int total_cost,
			int reservation_cancel, String reservation_time) {
		super();
		this.reservation_id = reservation_id;
		this.booked_count = booked_count;
		this.mu_sch_id = mu_sch_id;
		this.customer_id = customer_id;
		this.total_cost = total_cost;
		this.reservation_cancel = reservation_cancel;
		this.reservation_time = reservation_time;
	}

	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public int getReservation_cancel() {
		return reservation_cancel;
	}
	public void setReservation_cancel(int reservation_cancel) {
		this.reservation_cancel = reservation_cancel;
	}
	public String getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}
	public int getBooked_count() {
		return booked_count;
	}
	public void setBooked_count(int booked_count) {
		this.booked_count = booked_count;
	}
	public int getMu_sch_id() {
		return mu_sch_id;
	}
	public void setMu_sch_id(int mu_sch_id) {
		this.mu_sch_id = mu_sch_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	@Override
	public String toString() {
		return "ReservatioinDto [reservation_id=" + reservation_id + ", booked_count=" + booked_count + ", mu_sch_id="
				+ mu_sch_id + ", customer_id=" + customer_id + ", total_cost=" + total_cost + "]";
	}
	
	
	
}
