package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.IMainImgDao;
import com.human.dao.IMusicalScheduleDao;
import com.human.dto.MainImgDto;
import com.human.dto.MusicalScheduleDto;

@Service
public class MainImgServiceImpl implements IMainImgService{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<MainImgDto> select_img(int img_num) throws Exception {
		// TODO Auto-generated method stub
		IMainImgDao dao= sqlSession.getMapper(IMainImgDao.class);
		return dao.select_img(img_num);
	}
	
}
