
package com.human.dao;

import java.util.List;

import com.human.dto.CustomerDto;
import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

public interface ICustomerDao {

	public List<CustomerDto> selectAll() throws Exception;
	
	public void insert(CustomerDto dto) throws Exception;
	
	public void update(CustomerDto dto) throws Exception;
	
	// 비번 업데이트
	public void pwUpdate(CustomerDto dto) throws Exception;
	
	public void delete(CustomerDto dto) throws Exception;
	
	public CustomerDto selectName(String customer_id) throws Exception;
	
	// 회원가입 시 아이디 중복체크
	public boolean selectId(String customer_id) throws Exception;
	
	// 아이디 찾기
	public List<CustomerDto> findCustomerId(String customer_email) throws Exception;
	
	public List<CustomerDto> findCustomerIdPhone(String customer_phone) throws Exception;
	
	// 비번 재발급(비밀번호 찾기)
	public int newPwUpdate(CustomerDto dto) throws Exception;
	
	public int pwCheck(CustomerDto dto) throws Exception;
	
	// 비번 재발급(문자)
	public int newPwUpdatePhone(CustomerDto dto) throws Exception;
	
	public int pwCheckPhone(CustomerDto dto) throws Exception;
	
	
	public CustomerDto nowPwCheck(String customer_id) throws Exception;
	
	// 장바구니
	public List<MusicalDto> selectMusicalsLike(String customer_id) throws Exception;
	
	//관리자 관련
	public List<CustomerDto> customer_listSearch(BoardVo vo) throws Exception;
	public int customer_listSearchCount(BoardVo vo) throws Exception;
	public void enabledUpdate(CustomerDto dto) throws Exception;
}
