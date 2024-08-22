package com.human.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.format.annotation.DateTimeFormat;

public class MusicalScheduleDto {
	private Integer mu_sch_id;
	private Integer musical_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mu_sch_date;
	@DateTimeFormat(pattern = "HH:mm:ss")
	private Date mu_sch_time;
	
	public MusicalScheduleDto() {}

	public MusicalScheduleDto(Integer mu_sch_id, Integer musical_id, Date mu_sch_date, Date mu_sch_time) {
		super();
		this.mu_sch_id = mu_sch_id;
		this.musical_id = musical_id;
		this.mu_sch_date = mu_sch_date;
		this.mu_sch_time = mu_sch_time;
	}


	@Override
	public String toString() {
		return "MusicalScheduleDto [mu_sch_id=" + mu_sch_id + ", musical_id=" + musical_id + ", mu_sch_date="
				+ mu_sch_date + ", mu_sch_time=" + mu_sch_time + "]";
	}

	public Integer getMu_sch_id() {
		return mu_sch_id;
	}

	public void setMu_sch_id(Integer mu_sch_id) {
		this.mu_sch_id = mu_sch_id;
	}

	public Integer getMusical_id() {
		return musical_id;
	}

	public void setMusical_id(Integer musical_id) {
		this.musical_id = musical_id;
	}

	public Date getMu_sch_date() {
		return mu_sch_date;
	}

	public void setMu_sch_date(Date mu_sch_date) {
		this.mu_sch_date = mu_sch_date;
	}

	public Date getMu_sch_time() {
		return mu_sch_time;
	}

	public void setMu_sch_time(Date mu_sch_time) {
		this.mu_sch_time = mu_sch_time;
	}
	
	//뮤지컬 일정 요일 구하기
	public String getDayOfWeekInKorean() {
        if (mu_sch_date == null) return "";
        SimpleDateFormat dayFormatter = new SimpleDateFormat("EEEE", Locale.KOREAN);
        String dayName = dayFormatter.format(mu_sch_date);
        return dayName;
    }
}
