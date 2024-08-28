
package com.human.dao;

import java.util.List;

import com.human.dto.CustomerDto;

public interface ICustomerDao {

	public List<CustomerDto> selectAll() throws Exception;
	
	public void insert(CustomerDto dto) throws Exception;
	
	public void update(CustomerDto dto) throws Exception;
	
	// 비번 업데이트
	public void pwUpdate(CustomerDto dto) throws Exception;
	
	public void delete(CustomerDto dto) throws Exception;
	
	public CustomerDto selectName(String customer_id) throws Exception;
	
	public boolean selectId(String customer_id) throws Exception;
	
	public CustomerDto findCustomerId(String customer_email) throws Exception;
	
	// 비번 재발급(비밀번호 찾기)
	public int newPwUpdate(CustomerDto dto) throws Exception;
	
	public int pwCheck(CustomerDto dto) throws Exception;
	
	public CustomerDto nowPwCheck(String customer_id) throws Exception;
	
//	public void authoritiesUpdate(CustomerDto dto) throws Exception;
}
