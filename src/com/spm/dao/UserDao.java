package com.spm.dao;

import com.spm.model.UserBean;

public interface UserDao extends BaseMapper<UserBean,Integer>{

	public UserBean login(UserBean u);
}
