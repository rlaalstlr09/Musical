package com.human.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.ICharacterDao;
import com.human.dto.CharacterDto;
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
	
	

}
