package com.human.dao;

import java.util.List;

import com.human.dto.MainImgDto;

public interface IMainImgDao {

	public List<MainImgDto> select_img(int img_num) throws Exception;

}
