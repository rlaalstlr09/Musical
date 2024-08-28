
package com.human.service;

import java.util.List;

import com.human.dto.CustomerDto;

public interface ICustomerService {
	
	public List<CustomerDto> selectAll() throws Exception;
	
	public CustomerDto selectName(String customer_id) throws Exception;

	public void insert(CustomerDto dto) throws Exception;
	 
	public void delete(CustomerDto dto) throws Exception;
	
	public void update(CustomerDto dto) throws Exception;
	
	public void pwUpdate(CustomerDto dto) throws Exception;
	
	public boolean selectId(String customer_id) throws Exception;
	
	public CustomerDto findCustomerId(String customer_email) throws Exception;
	
	// 비밀번호 재발급
	public void newPwUpdate(CustomerDto dto) throws Exception;
	
	public int pwCheck(CustomerDto dto) throws Exception;
	
	// 현재 비밀번호 확인
	public CustomerDto nowPwCheck(String customer_id) throws Exception;
	
//	public void authoritiesUpdate(CustomerDto dto) throws Exception;
}
