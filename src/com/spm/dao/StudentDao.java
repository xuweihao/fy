package com.spm.dao;

import com.spm.model.Student;

public interface StudentDao extends BaseMapper<Student,Integer>{

	public int isExist(Student stu);
}
