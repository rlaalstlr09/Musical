package com.human.dto;

public class MainImgDto {
	private int img_id;
	private int musical_id;
	private String img_name;
	private int img_num;
	
	public MainImgDto() {}	
	
	public MainImgDto(int img_id, int musical_id, String img_name, int img_num) {
		super();
		this.img_id = img_id;
		this.musical_id = musical_id;
		this.img_name = img_name;
		this.img_num = img_num;
	}



	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public int getMusical_id() {
		return musical_id;
	}
	public void setMusical_id(int musical_id) {
		this.musical_id = musical_id;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public int getImg_num() {
		return img_num;
	}
	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}
	@Override
	public String toString() {
		return "MainImg [img_id=" + img_id + ", musical_id=" + musical_id + ", img_name=" + img_name + ", img_num="
				+ img_num + "]";
	}
	
	
	
}