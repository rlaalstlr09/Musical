package com.human.dao;

import com.human.dto.MainImgDto;

public interface IMainImgDao {
	public MainImgDto select_img(int img_num) throws Exception;

}