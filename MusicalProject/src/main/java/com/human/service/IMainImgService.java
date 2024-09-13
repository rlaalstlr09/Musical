package com.human.service;

import com.human.dto.MainImgDto;

public interface IMainImgService {
	public MainImgDto select_img(int img_num) throws Exception;
}
