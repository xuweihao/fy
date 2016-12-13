package com.spm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

	public static String DateToString(Date date){
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd"); 
		return time.format(date); 
	}
	
	public static String DateToString2(Date date){
		SimpleDateFormat time=new SimpleDateFormat("yyyyÄêMMÔÂ"); 
		return time.format(date); 
	}
	
	
	public static String DateToString3(Date date){
		SimpleDateFormat time=new SimpleDateFormat("yyyy/MM"); 
		return time.format(date); 
	}
}
