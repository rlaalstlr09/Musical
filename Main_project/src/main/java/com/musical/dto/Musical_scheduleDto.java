package com.musical.dto;

public class Musical_scheduleDto {

	public int mu_sch_id;
	public int musical_id;
	public int venue_id;
	public String mu_sch_date;
	public String mu_sch_time;
	public int hall_id;
	public String seat_count;
	
	
	public Musical_scheduleDto() {
		
	}
	


	public Musical_scheduleDto(int mu_sch_id, int musical_id, int venue_id, String mu_sch_date, String mu_sch_time,
			int hall_id, String seat_count) {
		super();
		this.mu_sch_id = mu_sch_id;
		this.musical_id = musical_id;
		this.venue_id = venue_id;
		this.mu_sch_date = mu_sch_date;
		this.mu_sch_time = mu_sch_time;
		this.hall_id = hall_id;
		this.seat_count = seat_count;
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


	public int getVenue_id() {
		return venue_id;
	}


	public void setVenue_id(int venue_id) {
		this.venue_id = venue_id;
	}


	public String getMu_sch_date() {
		return mu_sch_date;
	}


	public void setMu_sch_date(String mu_sch_date) {
		this.mu_sch_date = mu_sch_date;
	}


	public String getMu_sch_time() {
		return mu_sch_time;
	}


	public void setMu_sch_time(String mu_sch_time) {
		this.mu_sch_time = mu_sch_time;
	}


	public int getHall_id() {
		return hall_id;
	}


	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}


	public String getSeat_count() {
		return seat_count;
	}


	public void setSeat_count(String seat_count) {
		this.seat_count = seat_count;
	}


	@Override
	public String toString() {
		return "Musical_scheduleDto [mu_sch_id=" + mu_sch_id + ", musical_id=" + musical_id + ", venue_id=" + venue_id
				+ ", mu_sch_date=" + mu_sch_date + ", mu_sch_time=" + mu_sch_time + ", hall_id=" + hall_id
				+ ", seat_count=" + seat_count + "]";
	}

	
}
