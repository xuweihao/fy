package com.spm.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;

public class ExcelExport<T>{
	
	
	public void exportExcel(String title,String[] headers, Collection<T> dataset,
            OutputStream out,String[] headers2) {
        exportExcel(title,headers, dataset, out, "yyyy-MM-dd",headers2);
    }
	
	public void exportExcel2(String title,String[] headers, Collection<T> dataset,
            OutputStream out,String[] headers2,String time) {
        try {
			exportExcel2( title,headers, dataset, out, "yyyy-MM-dd",headers2,time);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	public void exportExcel2(String title,String[] headers,
            Collection<T> dataset, OutputStream out, String pattern,String[] headers2,String time) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格
        HSSFSheet sheet = workbook.createSheet();
        // 设置表格默认列宽度为15个字节
        /*sheet.setDefaultColumnWidth((short) 15);*/
        sheet.setDefaultColumnWidth((short) 16);
        sheet.setColumnWidth(0,  8 * 256);
        sheet.setColumnWidth(1,  28 * 256);
        sheet.setColumnWidth(2,  18 * 256);
        sheet.setColumnWidth(3,  15 * 256);
        sheet.setDefaultRowHeight((short)480);
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
       
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell(0);
        cell.setCellStyle(style);
        // 遍历集合数据，产生数据行
        Iterator<T> it = dataset.iterator();
        int index = -1;
        int i=0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            T t = (T) it.next();
            List<String> list = (List)t;
            for(i=0;i<list.size();i++){
            	cell = row.createCell(i);
            	cell.setCellValue(list.get(i));
            }
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        	try {
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}   
        }

    }
	
	
	
	
	public void exportExcel(String title,String[] headers,
            Collection<T> dataset, OutputStream out, String pattern,String[] headers2) {
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格
        HSSFSheet sheet = workbook.createSheet();
        // 设置表格默认列宽度为15个字节
        /*sheet.setDefaultColumnWidth((short) 15);*/
        sheet.setDefaultColumnWidth((short) 8);
        sheet.setColumnWidth(0,  18 * 256);
        sheet.setColumnWidth(1,  15 * 256);
        sheet.setColumnWidth(2,  15 * 256);
        sheet.setColumnWidth(3,  14 * 256);
        sheet.setDefaultRowHeight((short)450);
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        /*style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);*/
        style.setFillForegroundColor(HSSFColor.WHITE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short) 10);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        /*style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);*/
        style2.setFillForegroundColor(HSSFColor.WHITE.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        style2.setWrapText(true);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);

        
        
        HSSFRow row = sheet.createRow(0);
        String time = DateFormat.DateToString2(new Date());
        sheet.addMergedRegion(new Region(0,(short) 0, 0, (short)(headers.length-1)));
        HSSFCell cell = row.createCell(0);
        cell.setCellStyle(style);
        cell.setCellValue("("+time+")"+title);

        // 产生表格标题行
        row = sheet.createRow(1);
        for (short i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellStyle(style);
            if(headers[i].endsWith("日期")||headers[i].endsWith("有效期")){
            	sheet.setColumnWidth(i, 11 * 256);
            }
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        // 遍历集合数据，产生数据行
        Iterator<T> it = dataset.iterator();
        int index = 1;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            T t = (T) it.next();
            for(int i = 0;i<headers2.length;i++){
            	 String getMethodName = "get"
                         + headers2[i].substring(0, 1).toUpperCase()
                         + headers2[i].substring(1);
            	 cell = row.createCell(i);
            	 cell.setCellStyle(style2);
            	 try {
                    Class tCls = t.getClass();
                    Method getMethod = tCls.getMethod(getMethodName,
                            new Class[] {});
                    Object value = getMethod.invoke(t, new Object[] {});
                    // 判断值的类型后进行强制类型转换
                    String textValue = null;
                   
                    // 其它数据类型都当作字符串简单处理
                	if(!"".equals(value) && value!=null){
                		textValue = value.toString();
                	}else{
                		textValue = null;
                	}
                    // 如果不是图片数据，就利用正则表达式判断textValue是否全部由数字组成
                    if (textValue != null) {
                        Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                        Matcher matcher = p.matcher(textValue);
                        if (matcher.matches()) {
                            // 是数字当作double处理
                            cell.setCellValue(Double.parseDouble(textValue));
                        } else {
                            HSSFRichTextString richString = new HSSFRichTextString(
                                    textValue);
                            HSSFFont font3 = workbook.createFont();
                            font3.setColor(HSSFColor.BLUE.index);
                            richString.applyFont(font3);
                            cell.setCellValue(richString);
                        }
                    }
                } catch (SecurityException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } finally {
                    // 清理资源
                }
            }
           
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
        	try {
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
        }

    }
}