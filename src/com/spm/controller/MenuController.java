package com.spm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spm.model.MenuBean;
import com.spm.model.TreeBean;
import com.spm.model.UserBean;
import com.spm.service.MenuService;

@Controller
@RequestMapping(value="menu.do")
public class MenuController extends BaseController{

	@Resource(name="menuService")
	private MenuService menuService;
	
	@RequestMapping(value="selectMenusList.do")
	public void selectMenusList(MenuBean menu,HttpSession session,HttpServletResponse response){
		/*UserBean user = (UserBean)session.getAttribute("UserBean");
		menu.setUserId(user.getId());*/
		List<MenuBean> list = menuService.findLikeMenus(menu);
		toJson(list,response);
	}
	
	
	@RequestMapping(value="selectHmenusList.do")
	public void selectHmenusList(MenuBean menu,HttpSession session,HttpServletResponse response){
		/*UserBean user = (UserBean)session.getAttribute("UserBean");
		menu.setUserId(user.getId());*/
		List<MenuBean> list = menuService.findLikeMenus(menu);
		List<TreeBean> tree = new ArrayList<TreeBean>();
		for(MenuBean m:list){
			TreeBean tt = new TreeBean();
			tt.setId(m.getId());
			tt.setState("open");
			tt.setText(m.getName());
			if(!"".equals(m.getUrl())){
				tt.setUrl(m.getUrl());
			}
			List<MenuBean> list2 = menuService.findMenusByhId(m.getId());
			List<TreeBean> tree2 = new ArrayList<TreeBean>();
			if(!list2.isEmpty()){
				for(MenuBean m2:list2){
					TreeBean tt2 = new TreeBean();
					tt2.setId(m2.getId());
					tt2.setState("close");
					tt2.setText(m2.getName());
					tt2.setUrl(m2.getUrl());
					tree2.add(tt2);
				}
				tt.setChildren(tree2);
			}
			tree.add(tt);
		}
		toJson(tree,response);
	}
	
	
	
	
}
