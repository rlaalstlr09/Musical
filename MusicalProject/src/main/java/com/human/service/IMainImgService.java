package com.human.service;

import java.util.List;

import com.human.dto.MainImgDto;

public interface IMainImgService {
	public List<MainImgDto> select_img(int img_num) throws Exception;
}
