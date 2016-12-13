package com.spm.model;

import java.util.ArrayList;
import java.util.List;

public class RightsBean extends BaseBean{

	private String rightsName;
	
	private Integer roleId;
	
	private List<MenuBean> menus = new ArrayList<MenuBean>();

	public String getRightsName() {
		return rightsName;
	}

	public void setRightsName(String rightsName) {
		this.rightsName = rightsName;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public List<MenuBean> getMenus() {
		return menus;
	}

	public void setMenus(List<MenuBean> menus) {
		this.menus = menus;
	}
	
	
	
	
}
