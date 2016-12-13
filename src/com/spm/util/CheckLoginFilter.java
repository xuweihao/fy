package com.spm.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spm.model.UserBean;


public class CheckLoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest) servletRequest;
	     HttpServletResponse response = (HttpServletResponse) servletResponse;
	     HttpSession session = request.getSession();
		
	     // 获得用户请求的URI
         String path = request.getRequestURI();
         String contextPath = request.getContextPath();
         String url = path.substring(contextPath.length());
         String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/jlxt/";
         
         UserBean user = (UserBean)request.getSession().getAttribute("User");
         
         if (user == null) {
        	 PrintWriter out = response.getWriter();
     		 out.write("<script type='text/javascript'>window.parent.location.href='"+basePath+"user.do/login.do'</script>");
             return;
         }
         if (user!=null) {
             filterChain.doFilter(servletRequest, servletResponse);
             return;
         }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
