package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IFaqDao;
import com.human.dto.FaqDto;
import com.human.vo.BoardVo;

@Service
public class FaqServiceimpl implements IFaqService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void create(FaqDto faq) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		dao.create(faq);
	}

	@Override
	public FaqDto read(Integer fId) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		return dao.read(fId);
	}

	@Override
	public void update(FaqDto faq) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		dao.update(faq);
	}

	@Override
	public void delete(Integer fId) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		dao.delete(fId);
	}


	@Override
	public List<FaqDto> listSearch(BoardVo vo) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		return dao.listSearch(vo);
	}

	@Override
	public int listSearchCount(BoardVo vo) throws Exception {
		IFaqDao dao = sqlSession.getMapper(IFaqDao.class);
		return dao.listSearchCount(vo);
	}

	

}
