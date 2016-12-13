package com.spm.service;

import java.util.List;

import com.spm.model.MenuBean;

public interface MenuService {

	public List<MenuBean> findLikeMenus(MenuBean menuBean);
	
	
	public List<MenuBean> findMenusByhId(int hId);
}
