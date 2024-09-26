
package com.human.dao;

import com.human.dto.AuthoritiesDto;

public interface IAuthoritiesDao {
	
	public void insert(AuthoritiesDto dto) throws Exception;
		
	public void delete(AuthoritiesDto dto) throws Exception;
	
	//관리자관련
	public void authorityUpdate(AuthoritiesDto dto) throws Exception;
	//qna관련
	public AuthoritiesDto showQna(String customer_id) throws Exception;
}
