package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.INoticeDao;
import com.human.dto.NoticeDto;
import com.human.vo.BoardVo;

@Service
public class NoticeServiceimpl implements INoticeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void create(NoticeDto notice) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		dao.create(notice);
	}

	@Override
	public NoticeDto read(Integer nId) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		return dao.read(nId);
	}

	@Override
	public void update(NoticeDto notice) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		dao.update(notice);
	}

	@Override
	public void delete(Integer nId) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		dao.delete(nId);
	}

	

	@Override
	public List<NoticeDto> listSearch(BoardVo vo) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		return dao.listSearch(vo);
	}

	@Override
	public int listSearchCount(BoardVo vo) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		return dao.listSearchCount(vo);
	}

	
	
	@Override
	public void nHitUpdate(int nId) throws Exception {
		INoticeDao dao = sqlSession.getMapper(INoticeDao.class);
		dao.nHitUpdate(nId);
	}

}
