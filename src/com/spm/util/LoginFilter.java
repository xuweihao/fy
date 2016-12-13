package com.spm.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.spm.model.UserBean;

public class LoginFilter extends OncePerRequestFilter  {


	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String[] notFilter = new String[]{"login.do"};
		UserBean user =(UserBean)request.getSession().getAttribute("User");
		// �����uri  
		String uri = request.getRequestURI();  
		if(user==null){
			if(uri.indexOf("page") != -1 || uri.endsWith("index.jsp") || uri.endsWith(".do")){
				boolean doFilter = true;
				for(String s : notFilter){
					if (uri.indexOf(s) != -1) {
						doFilter = false;  
	                    break;
					}
				}
				if(doFilter){  
					PrintWriter out = response.getWriter(); 
					out.write("<script type='text/javascript'>"
							+ "window.location.href='"+request.getContextPath()+"/login.jsp';</script>");
							//+ "window.location.href='"+request.getContextPath()+"/login.jsp';
				} else {  
		            // ���uri�в�����background�������  
		            filterChain.doFilter(request, response);  
		        }
			}else {
	            // ���uri�в�����page�������  
	            filterChain.doFilter(request, response);  
	        }
		}else {
            // ���uri�в�����page�������  
            filterChain.doFilter(request, response);  
        }
			
	}

}
