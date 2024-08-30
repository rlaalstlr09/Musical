package com.human.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ActorDto {
	private int actor_id;
	private String actor_name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private double height;
	private double weight;
	private String actor_img;
	
	
	public String getActor_img() {
		return actor_img;
	}
	public void setActor_img(String actor_img) {
		this.actor_img = actor_img;
	}
	public int getActor_id() {
		return actor_id;
	}
	public void setActor_id(int actor_id) {
		this.actor_id = actor_id;
	}
	public String getActor_name() {
		return actor_name;
	}
	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	
	
	
	@Override
	public String toString() {
		return "ActorDto [actor_id=" + actor_id + ", actor_name=" + actor_name + ", birthday=" + birthday + ", height="
				+ height + ", weight=" + weight + ", actor_img=" + actor_img + "]";
	}
	public ActorDto(int actor_id, String actor_name, Date birthday, double height, double weight, String actor_img) {
		super();
		this.actor_id = actor_id;
		this.actor_name = actor_name;
		this.birthday = birthday;
		this.height = height;
		this.weight = weight;
		this.actor_img = actor_img;
	}
	public ActorDto() {
		
	}

}
