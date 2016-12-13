package com.spm.service;

import java.util.List;

import com.spm.model.ShoufeiBean;

public interface ShoufeiService {

	public int insertShoufei(ShoufeiBean sf);
	
	public int updateShoufei(ShoufeiBean sf);
	
	public int deleteShoufei(ShoufeiBean sf);
	
	public List queryShoufeiList(ShoufeiBean sf);
	
	public int queryShoufeiCount(ShoufeiBean sf);
	
	public ShoufeiBean queryShoufeiById(Integer id);
	
	public ShoufeiBean queryShoufeiByNo(String no);
	
	public ShoufeiBean queryShoufeiByStuId(Integer stuId);
}
