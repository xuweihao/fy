package com.spm.dao;

import com.spm.model.ShoufeiBean;

public interface ShoufeiDao extends BaseMapper<ShoufeiBean,Integer>{

	
	public ShoufeiBean findShoufeiByNo(String no);
	
	public ShoufeiBean findShoufeiByStuId(Integer stuId);
	
}
