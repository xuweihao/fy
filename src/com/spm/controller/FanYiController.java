package com.spm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spm.model.DataBean;
import com.spm.model.UserBean;
import com.spm.model.Word;
import com.spm.service.DataBeanService;
import com.spm.service.WordService;

@Controller
@RequestMapping(value="fanyi.do")
public class FanYiController extends BaseController{

	@Resource(name="dataBeanService")
	private DataBeanService dataBeanService;
	
	@Resource(name="wordService")
	private WordService wordService;
	
	@RequestMapping(value="toCNtoEn.do")
	public String toCNtoEn(Model model){
		DataBean db = new DataBean();
		db.setDataCode("type");
		List list = dataBeanService.searchPdataByCode(db);
		model.addAttribute("list", list);
		return "page/fanyi/chtoEn";
	}
	
	@RequestMapping(value="toEntoCN.do")
	public String toEntoCN(Model model){
		DataBean db = new DataBean();
		db.setDataCode("type");
		List list = dataBeanService.searchPdataByCode(db);
		model.addAttribute("list", list);
		return "page/fanyi/Entoch";
	}
	
	@RequestMapping(value="toSeachCntoEn.do")
	public void toSeachCntoEn(Word word,Model model,HttpServletResponse response){
		List  list = wordService.toSeachCELike(word);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", list.size());
		toJson(map,response);
	}
	
	
	@RequestMapping(value="toSeachEntoCn.do")
	public void toSeachEntoCn(Word word,Model model,HttpServletResponse response){
		List  list = wordService.toSeachCELike(word);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", list.size());
		toJson(map,response);
	}
	
	@RequestMapping(value="insertWord.do")
	public void insertWord(Word word,HttpSession session,HttpServletResponse response){
		int num = 0;
		UserBean u = (UserBean)session.getAttribute("User");
		word.setUpdateUser(u.getName());
		if(word.getId()==null){
			word.setCreateUser(u.getName());
			num = wordService.insertWord(word);
		}else{
			num = wordService.updateWord(word);
		}
		toJson(num,response);
	}
	
	@RequestMapping(value="selectfanyiById.do")
	public void selectfanyiById(Integer id,HttpServletResponse response){
		if(id==null || id==0){
			toJson(new Word(),response);
		}else{
			Word word= wordService.findWordById(id);
			toJson(word,response);
		}
	}
	
	@RequestMapping(value="delById.do")
	public void delById(Integer id,HttpSession session,HttpServletResponse response){
		UserBean u = (UserBean)session.getAttribute("User");
		Word word = new Word();
		word.setUpdateUser(u.getName());
		word.setId(id);
		int num = wordService.delWord(word);
		toJson(num,response);
	}
}
