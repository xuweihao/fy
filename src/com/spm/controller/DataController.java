package com.spm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spm.model.DataBean;
import com.spm.model.UserBean;
import com.spm.service.DataBeanService;
@Controller
@RequestMapping(value="data.do")
public class DataController extends BaseController{

	@Resource(name="dataBeanService")
	private DataBeanService dataBeanService;
	
	@RequestMapping(value="toData.do")
	public String toData(DataBean db,HttpServletResponse response){
		return "page/data/queryData";
	}
	
	
	@RequestMapping(value="selectdata.do")
	public void selectPdata(DataBean db,HttpServletResponse response){
		List list = dataBeanService.searchPdata(db);
		int count = dataBeanService.searchPdataCount(db);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", count);
		toJson(map,response);
	}
	
	@RequestMapping(value="selectData.do")
	public void selectData(DataBean db,HttpServletResponse response){
		List list = dataBeanService.searchData(db);
		int count = dataBeanService.searchDataCount(db);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", count);
		toJson(map,response);
	}
	
	
	@RequestMapping(value="selectdataByDataCode.do")
	public void selectdataByDataCode(DataBean db,HttpServletResponse response){
		List list = dataBeanService.searchPdataByCode(db);
		toJson(list,response);
	}
	
	@RequestMapping(value="insertData.do")
	public void insertData(DataBean db,HttpSession session,HttpServletResponse response){
		UserBean u = (UserBean)session.getAttribute("User");
		int num =0;
		if(db.getId()==null || db.getId()==0){
			db.setUpdateUser(u.getName());
			db.setCreateUser(u.getName());
			num= dataBeanService.insertData(db);
		}else{
			db.setUpdateUser(u.getName());
			num= dataBeanService.updateData(db);
		}
		toJson(num,response);
	}
	
	@RequestMapping(value="selectDataById.do")
	public void selectDataById(Integer id,HttpServletResponse response){
		DataBean db = dataBeanService.searchDataById(id);
		toJson(db,response);
	}
	
	@RequestMapping(value="delById.do")
	public void delById(Integer id,HttpSession session,HttpServletResponse response){
		UserBean u = (UserBean)session.getAttribute("User");
		DataBean db = new DataBean();
		db.setUpdateUser(u.getName());
		db.setId(id);
		int i = dataBeanService.delData(db);
		toJson(i,response);
	}
	
}
