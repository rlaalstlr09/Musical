package com.human.dao;

import java.util.ArrayList;


import com.human.dto.WorksDto;


public interface IWorksDao {
	public void insert(WorksDto dto) throws Exception;
	public WorksDto select(int actor_id) throws Exception;
	public ArrayList<WorksDto> selectAll(int actor_id) throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(WorksDto dto) throws Exception;	
	

}
