package com.human.dto;

public class ReservationDto {
	public int reservation_id;
	public int booked_count;
	public int mu_sch_id;
	public String customer_id;
	public int total_cost;
	public int reservation_cancel;
	public String reservation_time;
	public String payment_method;
	public String merchant_uid;
	
	
	public String musical_name;
	public String venue_name;
	public MusicalScheduleDto mu_sch_dto;
	
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

	
	
	
	
	public String getMusical_name() {
		return musical_name;
	}

	public void setMusical_name(String musical_name) {
		this.musical_name = musical_name;
	}

	public String getVenue_name() {
		return venue_name;
	}

	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}

	public MusicalScheduleDto getMu_sch_dto() {
		return mu_sch_dto;
	}

	public void setMu_sch_dto(MusicalScheduleDto mu_sch_dto) {
		this.mu_sch_dto = mu_sch_dto;
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
	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	@Override
	public String toString() {
		return "ReservationDto [reservation_id=" + reservation_id + ", booked_count=" + booked_count + ", mu_sch_id="
				+ mu_sch_id + ", customer_id=" + customer_id + ", total_cost=" + total_cost + ", reservation_cancel="
				+ reservation_cancel + ", reservation_time=" + reservation_time + ", payment_method=" + payment_method
				+ ", merchant_uid=" + merchant_uid + ", musical_name=" + musical_name + ", venue_name=" + venue_name
				+ ", mu_sch_dto=" + mu_sch_dto + "]";
	}
	
	
	
	
	
}
