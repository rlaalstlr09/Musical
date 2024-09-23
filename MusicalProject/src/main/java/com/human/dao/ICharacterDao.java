package com.human.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.CharacterDto;
import com.human.vo.BoardVo;


public interface ICharacterDao {
	public void insert(CharacterDto dto) throws Exception;
	public void insertActorCharacter() throws Exception;
	public CharacterDto select(int character_id) throws Exception;
	public ArrayList<CharacterDto> selectAll() throws Exception;
	public void delete(int character_id) throws Exception;
	public void update(CharacterDto dto) throws Exception;	
	
	//admin관련	
	public List<CharacterDto> character_read(@Param("vo") BoardVo vo, @Param("musical_id") int musical_id) throws Exception; //actor와 조인
	public int character_listSearchCount(@Param("musical_id") int musical_id) throws Exception;	
	public void character_create(CharacterDto character) throws Exception;
	public int character_id(@Param("musical_id") int musical_id,@Param("character_name") String character_name) throws Exception;
	public void character_update(CharacterDto character) throws Exception;
	public void character_delete(Integer character_id) throws Exception;
	public void character_Alldelete(Integer musical_id) throws Exception;	
	public List<CharacterDto> character_actor(@Param("actor_id") Integer actor_id,@Param("vo") BoardVo vo) throws Exception; //musical과 조인
	public int character_actor_listSearchCount(Integer actor_id) throws Exception;
	public CharacterDto character_read_delete(Integer character_id) throws Exception;
}
