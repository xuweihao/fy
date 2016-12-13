package com.spm.service;

import java.util.List;

import com.spm.model.Student;

public interface StudentService {

	
	public List queryStudentList(Student stu);

	public int queryStudentCount(Student stu);
	
	
	public int insertList(List list);
	
	public int insertStu(Student stu);
	
	public int updateStu(Student stu);
	
	public int deleteStu(Student stu);
	
	public Student queryStudentById(Integer id);
}
