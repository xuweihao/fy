package com.spm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spm.dao.DataBeanDao;
import com.spm.model.DataBean;
import com.spm.service.DataBeanService;

@Service(value="dataBeanService")
public class DataBeanServiceImpl implements DataBeanService {

	@Resource(name="dataBeanDao")
	private DataBeanDao dataBeanDao;

	public List<DataBean> searchPdata(DataBean db) {
		return dataBeanDao.searchPdata(db)==null?new ArrayList():dataBeanDao.searchPdata(db);
	}

	public int searchPdataCount(DataBean db) {
		return dataBeanDao.searchPdataCount(db);
	}

	public List<DataBean> searchPdataByCode(DataBean db) {
		return dataBeanDao.findEntity(db)==null?new ArrayList():dataBeanDao.findEntity(db);
	}

	
	public List<DataBean> searchData(DataBean db) {
		return dataBeanDao.searchData(db)==null?new ArrayList():dataBeanDao.searchData(db);
	}

	public int searchDataCount(DataBean db) {
		return dataBeanDao.searchDataCount(db);
	}

	public int insertData(DataBean db) {
		return dataBeanDao.insertEntity(db);
	}

	public int updateData(DataBean db) {
		return dataBeanDao.updateEntityById(db);
	}

	public DataBean searchDataById(Integer id) {
		return dataBeanDao.findEntityById(id);
	}

	public int delData(DataBean db) {
		return dataBeanDao.deleteEntityById(db);
	}

	
}
