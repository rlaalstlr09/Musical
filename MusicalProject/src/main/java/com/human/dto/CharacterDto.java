package com.human.dto;





public class CharacterDto {
	private int character_id; 
	private int musical_id;
	private String character_name;
	private int actor_id;
	
	
	
	public int getCharacter_id() {
		return character_id;
	}



	public void setCharacter_id(int character_id) {
		this.character_id = character_id;
	}



	public int getMusical_id() {
		return musical_id;
	}



	public void setMusical_id(int musical_id) {
		this.musical_id = musical_id;
	}



	public String getCharacter_name() {
		return character_name;
	}



	public void setCharacter_name(String character_name) {
		this.character_name = character_name;
	}



	public int getActor_id() {
		return actor_id;
	}



	public void setActor_id(int actor_id) {
		this.actor_id = actor_id;
	}



	public CharacterDto(int character_id, int musical_id, String character_name, int actor_id) {
		super();
		this.character_id = character_id;
		this.musical_id = musical_id;
		this.character_name = character_name;
		this.actor_id = actor_id;
	}



	@Override
	public String toString() {
		return "CharacterDto [character_id=" + character_id + ", musical_id=" + musical_id + ", character_name="
				+ character_name + ", actor_id=" + actor_id + "]";
	}



	public CharacterDto() {}
}
