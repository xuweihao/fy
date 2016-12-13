package com.spm.service;

import java.util.List;

import com.spm.model.DataBean;
import com.spm.model.MenuBean;

public interface DataBeanService {

	public List<DataBean> searchPdata(DataBean db);
	
	public List<DataBean> searchPdataByCode(DataBean db);
	
	public List<DataBean> searchData(DataBean db);
	
	public DataBean searchDataById(Integer id);
	
	
	public int searchPdataCount(DataBean db);
	
	public int searchDataCount(DataBean db);
	
	
	public int insertData(DataBean db);
	
	public int updateData(DataBean db);
	
	public int delData(DataBean db);
	
}
