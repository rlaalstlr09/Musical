package com.human.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.service.ActorCharacterServiceImpl;
import com.human.dao.IActorCharacterDao;
import com.human.dao.ICharacterDao;
import com.human.dto.CharacterDto;
import com.human.vo.BoardVo;
@Service
public class CharacterServiceImpl implements ICharacterService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(CharacterDto dto) throws Exception {
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		dao.insert(dto);		
	}
	@Override
	public void insertActorCharacter() throws Exception{
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		dao.insertActorCharacter();		
	}
	
	@Override
	public CharacterDto select(int id) throws Exception {
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		return dao.select(id);
	}

	@Override
	public ArrayList<CharacterDto> selectAll() throws Exception {
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		return dao.selectAll();
	}

	@Override
	public void delete(int id) throws Exception {
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		dao.delete(id);
		
	}

	@Override
	public void update(CharacterDto dto) throws Exception {
		ICharacterDao dao=sqlSession.getMapper(ICharacterDao.class);
		dao.update(dto);
		
	}
	
	//admin관련
	public List<CharacterDto> character_read(@Param("vo") BoardVo vo, @Param("musical_id") int musical_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_read(vo,musical_id);		
	}
	public int character_listSearchCount(@Param("musical_id") int musical_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_listSearchCount(musical_id);
	}
	public void character_create(CharacterDto character) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);		
		dao.character_create(character);
	}

	public int character_id(@Param("musical_id") int musical_id,@Param("character_name") String character_name) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_id(musical_id,character_name);
	}
	public void character_update(CharacterDto character) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		dao.character_update(character);
	}
	public void character_delete(Integer character_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		dao.character_delete(character_id);
	}
	
	public void character_Alldelete(Integer musical_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		dao.character_Alldelete(musical_id);
	}
	public List<CharacterDto> character_actor(Integer actor_id,BoardVo vo) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_actor(actor_id,vo);		
	}
	public int character_actor_listSearchCount(Integer actor_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_actor_listSearchCount(actor_id);
	}
	public CharacterDto character_read_delete(Integer character_id) throws Exception{
		ICharacterDao dao = sqlSession.getMapper(ICharacterDao.class);
		return dao.character_read_delete(character_id);		
	}


}
