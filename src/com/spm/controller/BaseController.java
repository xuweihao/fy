package com.spm.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class BaseController {

	public void toJson(Object obj,HttpServletResponse response){
		Gson gs = new Gson();
		String listJson = gs.toJson(obj);
		try{
			PrintWriter out = response.getWriter();
			out.write(listJson);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public String ArrayToString(String[] arr){
		StringBuffer s = new StringBuffer();
		if(arr.length>0){
			for(int i=0;i<arr.length;i++){
				if(i==0){
					s.append(arr[i]);
				}else{
					s.append(","+arr[i]);
				}
			}
		}
		return s.toString();
	}
	
	public static String setNO(String no){
		int length=8;
		StringBuffer sb = new StringBuffer();
		if(no!=null && !no.equals("")){
			if(no.length()<length){
				int need = length-no.length();
				for(int i=0;i<need;i++){
					sb.append("0");
				}
			}
		}
		return sb.toString()+no;
	}
	
	
	public static String getNO(String no){
		int i = 0;
		if(no!=null && !no.equals("")){
			i = Integer.valueOf(no);
			return i+"";
		}else{
			return "";
		}
		
	}
}
