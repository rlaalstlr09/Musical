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

	// 포맷팅된 날짜를 반환하는 메서드
    public String getFormattedDate() {
        return formatDate(mu_sch_date, "yyyy-MM-dd", "yyyy-MM-dd");
    }

    // 포맷팅된 시간을 반환하는 메서드
    public String getFormattedTime() {
        return formatDate(mu_sch_time, "yyyy-MM-dd HH:mm:ss", "HH:mm");
    }

    // 공통 포맷팅 메서드
    private String formatDate(String dateString, String inputFormatStr, String outputFormatStr) {
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputFormatStr);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputFormatStr);
        try {
            Date date = inputFormat.parse(dateString);
            return outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return dateString; // 포맷팅 실패 시 원래 문자열 반환
        }
    }

	
	//뮤지컬 일정 요일 구하기
	public String getDayOfWeekInKorean() {
        if (mu_sch_date == null || mu_sch_date.isEmpty()) return "";
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
        SimpleDateFormat dayFormatter = new SimpleDateFormat("E", Locale.KOREAN);
        try {
            Date date = formatter.parse(mu_sch_date);
            String dayName = dayFormatter.format(date);
            return dayName;
        } catch (ParseException e) {
            e.printStackTrace();
            return "";
        }
    }
	
	@Override
	public String toString() {
		return "Musical_scheduleDto [mu_sch_id=" + mu_sch_id + ", musical_id=" + musical_id + ", venue_id=" + venue_id
				+ ", mu_sch_date=" + mu_sch_date + ", mu_sch_time=" + mu_sch_time + ", hall_id=" + hall_id
				+ ", seat_count=" + seat_count + "]";
	}

	//뮤지컬 스케줄 날짜별 시간으로 매핑하기 위해 equals 추가
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mu_sch_date == null) ? 0 : mu_sch_date.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MusicalScheduleDto other = (MusicalScheduleDto) obj;
		if (mu_sch_date == null) {
			if (other.mu_sch_date != null)
				return false;
		} else if (!mu_sch_date.equals(other.mu_sch_date))
			return false;
		return true;
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
