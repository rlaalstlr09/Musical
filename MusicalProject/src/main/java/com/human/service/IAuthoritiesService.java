
package com.human.service;

import com.human.dto.AuthoritiesDto;

public interface IAuthoritiesService {
	
	public void insert(AuthoritiesDto dto) throws Exception;
	 
	public void delete(AuthoritiesDto dto) throws Exception;
	
	public void authorityUpdate(AuthoritiesDto dto) throws Exception;
	
	public AuthoritiesDto showQna(String customer_id) throws Exception;
	
}
