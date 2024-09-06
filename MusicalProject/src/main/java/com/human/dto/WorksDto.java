package com.human.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class WorksDto {
	private Integer actor_id;
	private String musical_poster;
	private String musical_title;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date musical_period_start;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date musical_period_end;
	private String character_name;
	public Integer getActor_id() {
		return actor_id;
	}
	public void setActor_id(Integer actor_id) {
		this.actor_id = actor_id;
	}
	public String getMusical_poster() {
		return musical_poster;
	}
	public void setMusical_poster(String musical_poster) {
		this.musical_poster = musical_poster;
	}
	public String getMusical_title() {
		return musical_title;
	}
	public void setMusical_title(String musical_title) {
		this.musical_title = musical_title;
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
	public String getCharacter_name() {
		return character_name;
	}
	public void setCharacter_name(String character_name) {
		this.character_name = character_name;
	}
	public WorksDto(Integer actor_id, String musical_poster, String musical_title, Date musical_period_start,
			Date musical_period_end, String character_name) {
		super();
		this.actor_id = actor_id;
		this.musical_poster = musical_poster;
		this.musical_title = musical_title;
		this.musical_period_start = musical_period_start;
		this.musical_period_end = musical_period_end;
		this.character_name = character_name;
	}
	
	public WorksDto() {}
	@Override
	public String toString() {
		return "WorksDto [actor_id=" + actor_id + ", musical_poster=" + musical_poster + ", musical_title="
				+ musical_title + ", musical_period_start=" + musical_period_start + ", musical_period_end="
				+ musical_period_end + ", character_name=" + character_name + "]";
	}
	
	
	
}
