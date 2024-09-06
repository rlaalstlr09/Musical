package com.human.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MusicalScheduleDto {

	private Integer mu_sch_id;
	private Integer musical_id;
	private Integer venue_id;
	private Integer hall_id;
	private String mu_sch_date;
	private String mu_sch_time;
	public String seat_count;
	
	
	public MusicalScheduleDto() {
		
	}


	public MusicalScheduleDto(Integer mu_sch_id, Integer musical_id, Integer venue_id, String mu_sch_date, String mu_sch_time,
			Integer hall_id, String seat_count) {
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


	public Integer getVenue_id() {
		return venue_id;
	}


	public void setVenue_id(Integer venue_id) {
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
	
	
	//뮤지컬 일정 요일 구하기
	public String getDayOfWeekInKorean() {
        if (mu_sch_date == null || mu_sch_date.isEmpty()) return "";
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
        SimpleDateFormat dayFormatter = new SimpleDateFormat("EEEE", Locale.KOREAN);
        try {
            Date date = formatter.parse(mu_sch_date);
            String dayName = dayFormatter.format(date);
            switch (dayName) {
                case "Monday": return "월요일";
                case "Tuesday": return "화요일";
                case "Wednesday": return "수요일";
                case "Thursday": return "목요일";
                case "Friday": return "금요일";
                case "Saturday": return "토요일";
                case "Sunday": return "일요일";
                default: return "";
            }
        } catch (ParseException e) {
            e.printStackTrace();
            return "";
        }
    }
	
	/*
	 * 	//뮤지컬 일정 요일 구하기
	public String getDayOfWeekInKorean() {
        if (mu_sch_date == null) return "";
        SimpleDateFormat dayFormatter = new SimpleDateFormat("EEEE", Locale.KOREAN);
        String dayName = dayFormatter.format(mu_sch_date);
        return dayName;
    }*/
}
