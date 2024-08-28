
package com.human.dao;

import com.human.dto.AuthoritiesDto;

public interface IAuthoritiesDao {
	
	public void insert(AuthoritiesDto dto) throws Exception;
		
	public void delete(AuthoritiesDto dto) throws Exception;
	
}
