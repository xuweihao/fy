package com.spm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spm.model.ShoufeiBean;
import com.spm.model.UserBean;
import com.spm.service.UserService;

@Controller
@RequestMapping(value="user.do")
public class UserController  extends BaseController{

	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public void login(UserBean u,HttpSession session,HttpServletResponse response){
		u = userService.login(u);
		if(u!=null){
			session.setAttribute("User", u);
			toJson(1,response);
		}else{
			toJson(0,response);
		}
	}
	
	
	@RequestMapping(value="toEdit.do")
	public String toEdit(HttpSession session,Model model){
		UserBean u = (UserBean)session.getAttribute("User");
		model.addAttribute("model", u);
		return "page/user/editUser";
	}
	
	@RequestMapping(value="edit.do")
	public void edit(UserBean u ,HttpServletResponse response){
		int num = userService.updateUser(u);
		toJson(num,response);
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session){
		try{
			session.removeAttribute("User");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return "login";
		}
	}
}
