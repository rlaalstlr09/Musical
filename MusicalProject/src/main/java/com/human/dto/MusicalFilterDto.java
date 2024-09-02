package com.human.dto;

import java.util.Date;

public class MusicalFilterDto {
	private String startDate = "";
	private String endDate = "";
	private Integer age = 0;
	private Integer minRunningtime = 0;
	private Integer maxRunningtime = 500;
	private String location = "";
	
	public MusicalFilterDto(String startDate, String endDate, Integer age, Integer minRunningtime,
			Integer maxRunningtime, String location) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.age = age;
		this.minRunningtime = minRunningtime;
		this.maxRunningtime = maxRunningtime;
		this.location = location;
	}
	
	public MusicalFilterDto() {}
	
	

	@Override
	public String toString() {
		return "MusicalFilterDto [startDate=" + startDate + ", endDate=" + endDate + ", age=" + age
				+ ", minRunningtime=" + minRunningtime + ", maxRunningtime=" + maxRunningtime + ", location=" + location
				+ "]";
	}

	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getMinRunningtime() {
		return minRunningtime;
	}
	public void setMinRunningtime(Integer minRunningtime) {
		this.minRunningtime = minRunningtime;
	}
	public Integer getMaxRunningtime() {
		return maxRunningtime;
	}
	public void setMaxRunningtime(Integer maxRunningtime) {
		this.maxRunningtime = maxRunningtime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
