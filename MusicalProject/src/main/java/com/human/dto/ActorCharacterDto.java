package com.human.dto;

public class ActorCharacterDto {
	private String character_name;
	private String actor_name;
	private String actor_url;
	private Integer actor_id;
	
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
	public String getActor_url() {
		return actor_url;
	}
	public void setActor_url(String actor_url) {
		this.actor_url = actor_url;
	}
	
	public ActorCharacterDto(String character_name, String actor_name, String actor_url,Integer actor_id) {
		super();
		this.character_name = character_name;
		this.actor_name = actor_name;
		this.actor_url = actor_url;
		this.actor_id= actor_id;
	}
	@Override
	public String toString() {
		return "ActorCharacterDto [character_name=" + character_name + ", actor_name=" + actor_name + ", actor_url="
				+ actor_url + ", actor_id=" + actor_id + "]";
	}
	public ActorCharacterDto() {
		
	}
	
	
}