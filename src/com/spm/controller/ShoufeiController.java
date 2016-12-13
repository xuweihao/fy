package com.spm.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.FileBufferedOutputStream;
import net.sf.jasperreports.engine.util.JRLoader;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spm.model.ShoufeiBean;
import com.spm.model.Student;
import com.spm.model.UserBean;
import com.spm.service.ShoufeiService;
import com.spm.service.StudentService;
import com.spm.util.DBUtil;
import com.spm.util.MoneyFormat;

@Controller
@RequestMapping(value="shoufei.do")
public class ShoufeiController extends BaseController{

	@Resource(name="shoufeiService")
	private ShoufeiService shoufeiService;
	
	@Resource(name="studentService")
	private StudentService studentService;
	
	@RequestMapping(value="toAddOrEditShoufei.do")
	public String toAdd(ShoufeiBean sf,HttpSession session,Model model){
		ShoufeiBean shoufei = shoufeiService.queryShoufeiByStuId(sf.getStuId());
		if(shoufei==null){
			Student stu = studentService.queryStudentById(sf.getStuId());
			UserBean u = (UserBean)session.getAttribute("User");
			sf.setYear1(stu.getYear1());
			sf.setYear2(stu.getYear2());
			sf.setName(stu.getName());
			sf.setState(stu.getState());
			sf.setClassName(stu.getClassName());
			sf.setXueqi(stu.getXueqi());
			//u.getName()
			model.addAttribute("model",sf);
			model.addAttribute("button","开票");
			return "page/shoufei/addOrEditShoufei";
		}else{
			shoufei.setNo(setNO(shoufei.getNo()));
			model.addAttribute("model",shoufei);
			model.addAttribute("button","保存");
			return "page/shoufei/addOrEditShoufei";
		}
	}
	
	
	@RequestMapping(value="addOrEditShoufei.do")
	public void add(ShoufeiBean sf,Model model,HttpSession session,HttpServletResponse response){
		UserBean u = (UserBean)session.getAttribute("User");
		int num =0;
		if(sf.getId()==null){
			sf.setCreateUser(u.getName());
			sf.setUpdateUser(u.getName());
			num= shoufeiService.insertShoufei(sf);
		}else{
			sf.setUpdateUser(u.getName());
			num= shoufeiService.updateShoufei(sf);
		}
		if(num==1){
			sf =  shoufeiService.queryShoufeiByNo(getNO(sf.getNo()));
			toJson(sf.getId(),response);
		}else{
			toJson(0,response);
		}
	}
	
	
	@RequestMapping(value="queryList.do")
	public void queryList(ShoufeiBean sf,HttpServletResponse response){
		sf.setNo(getNO(sf.getNo()));
		List list = shoufeiService.queryShoufeiList(sf);
		int count = shoufeiService.queryShoufeiCount(sf);
		Map map = new HashMap();
		map.put("rows", list);
		map.put("total", count);
		toJson(map,response);
	}
	
	
	@RequestMapping(value="queryById.do")
	public String queryById(Integer id,HttpServletResponse response,Model model){
		ShoufeiBean sf= shoufeiService.queryShoufeiById(id);
		sf.setNo(setNO(sf.getNo()));
		model.addAttribute("model",sf);
		return "page/shoufei/queryShoufeiById";
	}
	
	
	@RequestMapping(value="delById.do")
	public void delById(Integer id,HttpServletResponse response,HttpSession session,Model model){
		UserBean u = (UserBean)session.getAttribute("User");
		ShoufeiBean sf= new ShoufeiBean();
		sf.setId(id);
		sf.setUpdateUser(u.getName());
		int num = shoufeiService.deleteShoufei(sf);
		toJson(num,response);
	}
	
	
	@RequestMapping(value="dayin.do")
	public void dayin(Integer id,HttpServletRequest request,HttpServletResponse resp) throws Exception{
		File reportFile = new File(  request.getServletContext().getRealPath("/report/shoufei.jasper"));  
  
        Map parameters = new HashMap();  
  
        JasperPrint jasperPrint = null;  
        try  
        {  
            JasperReport personJasperReport = (JasperReport) JRLoader  
                    .loadObject(reportFile.getPath());  
            // 这里是给Person对象赋值  
            ShoufeiBean sf= shoufeiService.queryShoufeiById(id);
  
            Map<String,String> map = MoneyFormat.getMoney(sf.getTotal());
            if(map.get("wan")==null){
            	parameters.put("wan", "￥");
            }else{
            	parameters.put("wan",  map.get("wan"));
            }
            if(map.get("qian")==null){
            	parameters.put("qian", "￥");
            }else{
            	parameters.put("qian", map.get("qian"));
            }
            
            parameters.put("bai", map.get("bai"));
            parameters.put("shi", map.get("shi"));
            parameters.put("ge", map.get("ge"));
            parameters.put("id", id);
            parameters.put("no", setNO(sf.getNo()));
            
            // 将Person对象， 放入集合中，  
  
            // 将集合对象数据填充到JasperReport中.  
            //jasperPrint = JasperFillManager.fillReport(personJasperReport,  
            //        parameters, new JRBeanCollectionDataSource(list));  
            jasperPrint = JasperFillManager.fillReport(personJasperReport, parameters, DBUtil.getConn());
  
        }  
        catch (JRException e)  
        {  
            e.printStackTrace();  
        }  
        if (null != jasperPrint)  
        {  
            FileBufferedOutputStream fbos = new FileBufferedOutputStream();  
            JRPdfExporter exporter = new JRPdfExporter();  
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, fbos);  
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);  
            try  
            {  
                exporter.exportReport();  
                fbos.close();  
                if (fbos.size() > 0)  
                {  
                    resp.setContentType("application/pdf");  
                    resp.setContentLength(fbos.size());  
                    ServletOutputStream ouputStream = resp.getOutputStream();  
                    try  
                    {  
                        fbos.writeData(ouputStream);  
                        fbos.dispose();  
                        ouputStream.flush();  
                    }  
                    finally  
                    {  
                        if (null != ouputStream)  
                        {  
                            ouputStream.close();  
                        }  
                    }  
                }  
            }  
            catch (JRException e1)  
            {  
                e1.printStackTrace();  
            }  
            finally  
            {  
                if (null != fbos)  
                {  
                    fbos.close();  
                    fbos.dispose();  
                }  
            }  
        } 
	}
	
	
	
}
