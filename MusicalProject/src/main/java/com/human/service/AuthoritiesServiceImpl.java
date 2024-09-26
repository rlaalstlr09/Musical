
package com.human.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IAuthoritiesDao;
import com.human.dto.AuthoritiesDto;


@Service
public class AuthoritiesServiceImpl implements IAuthoritiesService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(AuthoritiesDto dto) throws Exception {
		IAuthoritiesDao dao = sqlSession.getMapper(IAuthoritiesDao.class);
		dao.insert(dto);
	}

	@Override
	public void delete(AuthoritiesDto dto) throws Exception{
		IAuthoritiesDao dao = sqlSession.getMapper(IAuthoritiesDao.class);
		dao.delete(dto);
	}
	
	public void authorityUpdate(AuthoritiesDto dto) throws Exception{
		IAuthoritiesDao dao = sqlSession.getMapper(IAuthoritiesDao.class);
		dao.authorityUpdate(dto);
	}
	public AuthoritiesDto showQna (String customer_id) throws Exception{
		IAuthoritiesDao dao = sqlSession.getMapper(IAuthoritiesDao.class);
		return dao.showQna(customer_id);
	}
}
