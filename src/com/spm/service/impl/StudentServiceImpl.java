package com.spm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spm.dao.StudentDao;
import com.spm.model.Student;
import com.spm.service.StudentService;

@Service(value="studentService")
public class StudentServiceImpl implements StudentService {

	@Resource(name="studentDao")
	private StudentDao studentDao;
	
	public List queryStudentList(Student stu) {
		List list = studentDao.findLikeEntity(stu);
		return list==null?new ArrayList():list;
	}

	public int queryStudentCount(Student stu) {
		return studentDao.findCount(stu);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int insertList(List list) {
		for(int i = 0;i<list.size();i++){
			Student stu = (Student)list.get(i);
			int num  = studentDao.isExist(stu);
			if(num>0){
				break;
			}else{
				num = studentDao.insertEntity(stu);
			}
			if(num==0){
				return num;
			}
		}
		return 1;
	}

	public int deleteStu(Student stu) {
		return studentDao.deleteEntityById(stu);
	}

	public Student queryStudentById(Integer id) {
		return studentDao.findEntityById(id);
	}

	public int insertStu(Student stu) {
		int num  = studentDao.isExist(stu);
		if(num>0){
			num = 2;
		}else{
			num = studentDao.insertEntity(stu);
		}
		return num;
	}

	public int updateStu(Student stu) {
		return studentDao.updateEntityById(stu);
	}

}
