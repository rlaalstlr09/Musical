package com.human.service;

import java.util.ArrayList;


import com.human.dto.WorksDto;


public interface IWorksService {
	
	public void insert(WorksDto dto) throws Exception;
	public WorksDto select(Integer actor_id) throws Exception;
	public ArrayList<WorksDto> selectAll(int actor_id) throws Exception;
	public void delete(int actor_id) throws Exception;
	public void update(WorksDto dto) throws Exception;	
	

}
