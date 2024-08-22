package com.human.dto;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class MusicalDto {
	private Integer musical_id;
	private String musical_title;
	private String musical_poster;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date musical_period_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date musical_period_end;
	private Integer musical_runningtime;
	private String musical_agelimit;
	
	//뮤지컬 리스트에서 공연장 정보 출력을 위한 데이터
	private String venue_name;
	private String hall_name;
	
	//뮤지컬 상세보기 좌석 등급, 가격 
	private List<SeatDto> seatDtos;
	
	public MusicalDto() {}

	
	//뮤지컬 리스트 출력을 위한 생성자
	public MusicalDto(Integer musical_id, String musical_title, String musical_poster, Date musical_period_start,
			Date musical_period_end, String venue_name, String hall_name) {
		super();
		this.musical_id = musical_id;
		this.musical_title = musical_title;
		this.musical_poster = musical_poster;
		this.musical_period_start = musical_period_start;
		this.musical_period_end = musical_period_end;
		this.venue_name = venue_name;
		this.hall_name = hall_name;
	}
	
	//뮤지컬 상세보기를 위한 생성자
	public MusicalDto(MusicalDto musicalDto, List<SeatDto> seatDtos) {
		super();
		this.musical_id = musicalDto.getMusical_id();
		this.musical_title = musicalDto.getMusical_title();
		this.musical_poster = musicalDto.getMusical_poster();
		this.musical_period_start = musicalDto.getMusical_period_start();
		this.musical_period_end = musicalDto.getMusical_period_end();
		this.musical_runningtime = musicalDto.getMusical_runningtime();
		this.musical_agelimit = musicalDto.getMusical_agelimit();
		this.venue_name = musicalDto.getVenue_name();
		this.hall_name = musicalDto.getHall_name();
		this.seatDtos = seatDtos;
	}

	

	@Override
	public String toString() {
		return "MusicalDto [musical_id=" + musical_id + ", musical_title=" + musical_title + ", musical_poster="
				+ musical_poster + ", musical_period_start=" + musical_period_start + ", musical_period_end="
				+ musical_period_end + ", musical_runningtime=" + musical_runningtime + ", musical_agelimit="
				+ musical_agelimit + ", venue_name=" + venue_name + ", hall_name=" + hall_name + ", seatDtos="
				+ seatDtos + "]";
	}


	public List<SeatDto> getSeatDtos() {
		return seatDtos;
	}


	public void setSeatDtos(List<SeatDto> seatDtos) {
		this.seatDtos = seatDtos;
	}
	

	public Date getMusical_period_start() {
		return musical_period_start;
	}


	public void setMusical_period_start(Date musical_period_start) {
		this.musical_period_start = musical_period_start;
	}

	public Date getMusical_period_end() {
		return musical_period_end;
	}

	public void setMusical_period_end(Date musical_period_end) {
		this.musical_period_end = musical_period_end;
	}

	public String getVenue_name() {
		return venue_name;
	}

	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}

	public String getHall_name() {
		return hall_name;
	}

	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}

	public Integer getMusical_id() {
		return musical_id;
	}
	public void setMusical_id(Integer musical_id) {
		this.musical_id = musical_id;
	}
	public String getMusical_title() {
		return musical_title;
	}
	public void setMusical_title(String musical_title) {
		this.musical_title = musical_title;
	}
	public String getMusical_poster() {
		return musical_poster;
	}
	public void setMusical_poster(String musical_poster) {
		this.musical_poster = musical_poster;
	}
	public Integer getMusical_runningtime() {
		return musical_runningtime;
	}
	public void setMusical_runningtime(Integer musical_runningtime) {
		this.musical_runningtime = musical_runningtime;
	}
	public String getMusical_agelimit() {
		return musical_agelimit;
	}
	public void setMusical_agelimit(String musical_agelimit) {
		this.musical_agelimit = musical_agelimit;
	}
	
	
}
