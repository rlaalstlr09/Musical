package com.human.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.dao.IAdminDao;
import com.human.dto.ActorDto;
import com.human.dto.AdminDto;
import com.human.dto.CharacterDto;
import com.human.dto.HallDto;
import com.human.dto.MusicalDto;
import com.human.dto.QaDto;
import com.human.dto.ReservationDto;
import com.human.dto.ReviewDto;
import com.human.dto.VenueDto;
import com.human.vo.BoardVo;

@Service
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public void admin_create(AdminDto admin) throws Exception{
		IAdminDao dao = sqlSession.getMapper(IAdminDao.class);
		dao.admin_create(admin);
	}
	public List<AdminDto> admin_file_read(@RequestParam("table_id") Integer table_id,@RequestParam("table_name") String table_name,@RequestParam("table_crud") String table_crud) throws Exception{
		IAdminDao dao = sqlSession.getMapper(IAdminDao.class);
		return dao.admin_file_read(table_id,table_name,table_crud);
	}
	
	public List<AdminDto> admin_listSearch(BoardVo vo) throws Exception{
		IAdminDao dao = sqlSession.getMapper(IAdminDao.class);
		return dao.admin_listSearch(vo);
	}
	public int admin_listSearchCount(BoardVo vo) throws Exception{
		IAdminDao dao = sqlSession.getMapper(IAdminDao.class);
		return dao.admin_listSearchCount(vo);
	}



	
}
