package com.spm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spm.dao.MenuDao;
import com.spm.model.MenuBean;
import com.spm.service.MenuService;

@Service(value="menuService")
public class MenuServiceImpl implements MenuService {

	@Resource(name="menuDao")
	private MenuDao menuDao;
	
	public List<MenuBean> findLikeMenus(MenuBean menuBean) {
		List<MenuBean> list = menuDao.findLikeEntity(menuBean);
		return list==null?new ArrayList<MenuBean>():list;
	}

	public List<MenuBean> findMenusByhId(int hId) {
		MenuBean menuBean = new MenuBean();
		menuBean.sethId(hId);
		menuBean.setType("h");
		List<MenuBean> list = menuDao.findLikeEntity(menuBean);
		return list==null?new ArrayList<MenuBean>():list;
	}

}
