package com.spm.service;

import com.spm.model.UserBean;

public interface UserService {

	public UserBean login(UserBean u);
	
	public int updateUser(UserBean u);
}
