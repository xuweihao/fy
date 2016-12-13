package com.spm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spm.dao.UserDao;
import com.spm.model.UserBean;
import com.spm.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDao")
	private UserDao userDao;
	
	public UserBean login(UserBean u) {
		return userDao.login(u);
	}

	public int updateUser(UserBean u) {
		return userDao.updateEntityById(u);
	}

}
