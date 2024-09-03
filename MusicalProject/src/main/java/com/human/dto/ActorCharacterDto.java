package com.human.dto;

public class ActorCharacterDto {
	private String character_name;
	private String actor_name;
	private String actor_img;
	private Integer actor_id;
	private Integer character_id;
	
	
	
	public ActorCharacterDto(Integer actor_id, Integer character_id) {
		super();
		this.actor_id = actor_id;
		this.character_id = character_id;
	}
	public Integer getCharacter_id() {
		return character_id;
	}
	public void setCharacter_id(Integer character_id) {
		this.character_id = character_id;
	}
	public Integer getActor_id() {
		return actor_id;
	}
	public void setActor_id(Integer actor_id) {
		this.actor_id = actor_id;
	}
	public String getCharacter_name() {
		return character_name;
	}
	public void setCharacter_name(String character_name) {
		this.character_name = character_name;
	}
	public String getActor_name() {
		return actor_name;
	}
	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}
	public String getactor_img() {
		return actor_img;
	}
	public void setactor_img(String actor_img) {
		this.actor_img = actor_img;
	}
	
	public ActorCharacterDto(String character_name, String actor_name, String actor_img,Integer actor_id) {
		super();
		this.character_name = character_name;
		this.actor_name = actor_name;
		this.actor_img = actor_img;
		this.actor_id= actor_id;
	}
	@Override
	public String toString() {
		return "ActorCharacterDto [character_name=" + character_name + ", actor_name=" + actor_name + ", actor_img="
				+ actor_img + ", actor_id=" + actor_id + "]";
	}
	public ActorCharacterDto() {
		
	}
	
	
}
