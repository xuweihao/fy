package com.spm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spm.dao.ShoufeiDao;
import com.spm.model.ShoufeiBean;
import com.spm.service.ShoufeiService;
@Service(value="shoufeiService")
public class ShoufeiServiceImpl implements ShoufeiService {

	@Resource(name="shoufeiDao")
	private ShoufeiDao shoufeiDao;

	public int insertShoufei(ShoufeiBean sf) {
		int i = shoufeiDao.insertEntity(sf);
		return i;
	}

	public List queryShoufeiList(ShoufeiBean sf) {
		List list  = shoufeiDao.findLikeEntity(sf);
		return list==null?new ArrayList():list;
	}

	public int queryShoufeiCount(ShoufeiBean sf) {
		int count = shoufeiDao.findCount(sf);
		return count;
	}

	public ShoufeiBean queryShoufeiById(Integer id) {
		ShoufeiBean sf = shoufeiDao.findEntityById(id);
		return sf;
	}

	public int updateShoufei(ShoufeiBean sf) {
		int count = shoufeiDao.updateEntityById(sf);
		return count;
	}

	public int deleteShoufei(ShoufeiBean sf) {
		int count = shoufeiDao.deleteEntityById(sf);
		return count;
	}

	public ShoufeiBean queryShoufeiByNo(String no) {
		ShoufeiBean sf = shoufeiDao.findShoufeiByNo(no);
		return sf;
	}

	@Override
	public ShoufeiBean queryShoufeiByStuId(Integer stuId) {
		ShoufeiBean sf = shoufeiDao.findShoufeiByStuId(stuId);
		return sf;
	}
	
}
