package com.spm.dao;

import java.util.List;

import com.spm.model.DataBean;
import com.spm.model.MenuBean;

public interface DataBeanDao extends BaseMapper<DataBean,Integer>{

	public List<DataBean> searchPdata(DataBean db);
	
	public int searchPdataCount(DataBean db);
	
	public List<DataBean> searchData(DataBean db);
	
	public int searchDataCount(DataBean db);
	
	
}
