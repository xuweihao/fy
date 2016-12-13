package com.spm.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.spm.model.DataBean;
import com.spm.model.Student;
import com.spm.model.UserBean;
import com.spm.service.DataBeanService;
import com.spm.service.StudentService;

@Controller
@RequestMapping(value="stu.do")
public class StudentController extends BaseController{

	@Resource(name="studentService")
	private StudentService studentService;
	
	@Resource(name="dataBeanService")
	private DataBeanService dataBeanService;
	
	@RequestMapping(value="queryList.do")
	public void queryList(Student stu,HttpServletResponse response){
		List list = studentService.queryStudentList(stu);
		int count = studentService.queryStudentCount(stu);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", count);
		toJson(map,response);
	}
	
	@RequestMapping(value="selectStuById.do")
	public void selectStuById(Integer id,HttpServletResponse response,HttpSession session){
		UserBean u = (UserBean)session.getAttribute("User");
		Student stu = studentService.queryStudentById(id);
		toJson(stu,response);
	}
	
	@RequestMapping(value="insertStu.do")
	public void insertStu(Student stu,HttpServletResponse response,HttpSession session,Model model){
		int i = 0;
		UserBean u = (UserBean)session.getAttribute("User");
		if(stu.getId()==null){
			stu.setUpdateUser(u.getName());
			stu.setCreateUser(u.getName());
			i = studentService.insertStu(stu);
		}else{
			stu.setUpdateUser(u.getName());
			i = studentService.updateStu(stu);
		}
		toJson(i,response);
	}
	
	@RequestMapping(value="delById.do")
	public void delById(Integer id,HttpServletResponse response,HttpSession session){
		UserBean u = (UserBean)session.getAttribute("User");
		Student sf= new Student();
		sf.setId(id);
		sf.setUpdateUser(u.getName());
		int num = studentService.deleteStu(sf);
		toJson(num,response);
	}
	
	@RequestMapping(value="importFile.do")
	public String importFile(HttpServletRequest request,Model model){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file1");
		try {
			Map map = readUploadExcel(file.getInputStream());
			List<Student> retList = (List)map.get("retList");
			int i =0;
			if(retList.size()>0){
				i= studentService.insertList(retList);
			}
			model.addAttribute("state",i);
			model.addAttribute("msg", map.get("msg"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "page/student/importStu";
	}
	
	
	
	
	private Map readUploadExcel(InputStream is) {
		Map map = new HashMap();
		StringBuffer sb = new StringBuffer();
		List<Student> retList = new ArrayList();
		try {
			// 创建工作薄
			XSSFWorkbook wb = new XSSFWorkbook(is);
			// 得到工作表

			XSSFSheet sheet = wb.getSheet("学生上传");
			if (sheet == null) {
				System.out.println("不能修改sheet名称");
				throw new Exception("不能修改sheet名称");
			}
			// 读出Excel中预测头信息ID
			XSSFRow row = sheet.getRow(0);
			XSSFCell hssfCell = row.getCell((short) 0);// poi
			is.close();

			NumberFormat formatter = NumberFormat.getNumberInstance();
			SimpleDateFormat formatterDate = new java.text.SimpleDateFormat(
					"yyyy-MM-dd");
			formatter.setMaximumFractionDigits(0);
			Student stu;
			
			
			DataBean db = new DataBean();
			db.setDataCode("state");
			List<DataBean> stateList  = dataBeanService.searchPdataByCode(db);
			db.setDataCode("className");
			List<DataBean> classList  = dataBeanService.searchPdataByCode(db);
			db.setDataCode("xueqi");
			List<DataBean> xueqiList  = dataBeanService.searchPdataByCode(db);
			
			// 解析行信息
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {

				row = sheet.getRow(i);

				hssfCell = row.getCell((short) 1);
				String name = hssfCell.getStringCellValue();
				// 姓名不为空
				if (!name.equals(null)
						&& !name.equals("")) {
					stu = new Student();
					stu.setName(name);
					
					hssfCell = row.getCell((short) 2); 
					String parentName = hssfCell.getStringCellValue();
					stu.setParentName(parentName);
					
					hssfCell = row.getCell((short) 3); 
					String state = hssfCell.getStringCellValue();
					for(DataBean o:stateList){
						if(o.getDataName().equals(state)){
							stu.setState(state);
						}
					}
					
					if(stu.getState()==null){
						sb.append("姓名:"+name+"  "+state+"年级不存在\n");
						break;
					}
					
					hssfCell = row.getCell((short) 4); 
					String className =null;
					if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						Double classN = hssfCell.getNumericCellValue();
						className = classN.intValue()+"";
					}
					for(DataBean o:classList){
						if(o.getDataName().equals(className)){
							stu.setClassName(className);
						}
					}
					
					if(stu.getClassName()==null){
						sb.append("姓名:"+name+"  "+className+"班级不存在\n");
						break;
					}
					
					
					hssfCell = row.getCell((short) 5); 
					if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						Double year1 = hssfCell.getNumericCellValue();
						stu.setYear1(year1.intValue());
					}
					

					hssfCell = row.getCell((short) 6); 
					if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						Double year2 = hssfCell.getNumericCellValue();
						stu.setYear2(year2.intValue());
					}
					
					hssfCell = row.getCell((short) 7); 
					int xueqiNum =0;
					if (hssfCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						Double xueqi = hssfCell.getNumericCellValue();
						xueqiNum= xueqi.intValue();
						for(DataBean o:xueqiList){
							if(o.getDataName().equals(xueqiNum+"")){
								stu.setXueqi(xueqiNum);
							}
						}
					}
					
					if(stu.getXueqi()==null){
						sb.append("姓名:"+name+"  "+xueqiNum+"学期不存在\n");
						break;
					}
					
					
					retList.add(stu);
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("retList", retList);
		map.put("msg", sb.toString());
		return map;
	}
}
