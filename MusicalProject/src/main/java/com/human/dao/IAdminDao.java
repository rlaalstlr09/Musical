package com.human.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.human.dto.ActorDto;
import com.human.dto.AdminDto;
import com.human.dto.CharacterDto;
import com.human.dto.HallDto;
import com.human.dto.MusicalDto;
import com.human.dto.ReservationDto;
import com.human.dto.ReviewDto;
import com.human.dto.VenueDto;
import com.human.vo.BoardVo;

public interface IAdminDao {


	//admin관련
	public void admin_create(AdminDto admin) throws Exception;
	public void admin_update(AdminDto admin) throws Exception;
	public List<AdminDto> admin_listSearch(BoardVo vo) throws Exception;
	public int admin_listSearchCount(BoardVo vo) throws Exception;
	public List<AdminDto> admin_file_read(@Param("table_id") Integer table_id,@Param("table_name") String table_name,@Param("table_crud") String table_crud) throws Exception;
	public void admin_file_delete(String fileName) throws Exception;
	


}
