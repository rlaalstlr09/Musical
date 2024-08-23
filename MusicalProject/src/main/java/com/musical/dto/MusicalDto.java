package com.musical.dto;

public class MusicalDto {
	private int musical_id;
	private String musical_title;
	private String musical_poster;
	private String musical_period_start;
	private String musical_period_end;
	private int musical_runningtime;
	private String musical_agelimit;
	
	public MusicalDto() {
		
	}

	public MusicalDto(int musical_id, String musical_title, String musical_poster, String musical_period_start,
			String musical_period_end, int musical_runningtime, String musical_agelimit) {
		super();
		this.musical_id = musical_id;
		this.musical_title = musical_title;
		this.musical_poster = musical_poster;
		this.musical_period_start = musical_period_start;
		this.musical_period_end = musical_period_end;
		this.musical_runningtime = musical_runningtime;
		this.musical_agelimit = musical_agelimit;
	}

	public int getMusical_id() {
		return musical_id;
	}

	public void setMusical_id(int musical_id) {
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

	public String getMusical_period_start() {
		return musical_period_start;
	}

	public void setMusical_period_start(String musical_period_start) {
		this.musical_period_start = musical_period_start;
	}

	public String getMusical_period_end() {
		return musical_period_end;
	}

	public void setMusical_period_end(String musical_period_end) {
		this.musical_period_end = musical_period_end;
	}

	public int getMusical_runningtime() {
		return musical_runningtime;
	}

	public void setMusical_runningtime(int musical_runningtime) {
		this.musical_runningtime = musical_runningtime;
	}

	public String getMusical_agelimit() {
		return musical_agelimit;
	}

	public void setMusical_agelimit(String musical_agelimit) {
		this.musical_agelimit = musical_agelimit;
	}

	@Override
	public String toString() {
		return "MusicalDto [musical_id=" + musical_id + ", musical_title=" + musical_title + ", musical_poster="
				+ musical_poster + ", musical_period_start=" + musical_period_start + ", musical_period_end="
				+ musical_period_end + ", musical_runningtime=" + musical_runningtime + ", musical_agelimit="
				+ musical_agelimit + "]";
	}
	
}
