package com.spm.util;

import java.util.HashMap;
import java.util.Map;

public class MoneyFormat {

	public static Map getMoney(double i){
		
		String money = (int)i+"";
		Map<String,String> map = new HashMap<String,String>();
		int length = money.length();
		for(int j=1;j<=length;j++){
			String num = getUpNumber(Integer.valueOf(money.substring(length-j, length-j+1)));
			if(j==1){
				map.put("ge", num);
			}else if(j==2){
				map.put("shi", num);
			}else if(j==3){
				map.put("bai", num);
			}else if(j==4){
				map.put("qian", num);
			}else if(j==5){
				map.put("wan", num);
			}
		}
		return map;
	}
	
	
	public static String  getUpNumber(int i){
		String strNum= null;
		switch (i) { //ѡ������
        case 1:
          strNum = "Ҽ";
          break;
        case 2:
          strNum = "��";
          break;
        case 3:
          strNum = "��";
          break;
        case 4:
          strNum = "��";
          break;
        case 5:
          strNum = "��";
          break;
        case 6:
          strNum = "½";
          break;
        case 7:
          strNum = "��";
          break;
        case 8:
          strNum = "��";
          break;
        case 9:
          strNum = "��";
          break;
        case 0:
          strNum = "��";
          break;
      }
		return strNum;
	}
}
