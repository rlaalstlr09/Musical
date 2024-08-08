package com.human.dto;

public class MusicalDto {
	private Integer musical_id;
	private String musical_title;
	private String musical_poster;
	private String musical_period;
	private Integer musical_runningtime;
	private String musical_agelimit;
	
	public MusicalDto() {}
	
	public MusicalDto(Integer musical_id, String musical_title, String musical_poster, String musical_period,
			Integer musical_runningtime, String musical_agelimit) {
		super();
		this.musical_id = musical_id;
		this.musical_title = musical_title;
		this.musical_poster = musical_poster;
		this.musical_period = musical_period;
		this.musical_runningtime = musical_runningtime;
		this.musical_agelimit = musical_agelimit;
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
	public String getMusical_period() {
		return musical_period;
	}
	public void setMusical_period(String musical_period) {
		this.musical_period = musical_period;
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
