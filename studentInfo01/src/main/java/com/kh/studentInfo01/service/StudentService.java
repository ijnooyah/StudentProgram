package com.kh.studentInfo01.service;

import java.util.List;

import com.kh.studentInfo01.domain.StudentVo;

public interface StudentService {
	public List<StudentVo> selectAll();
	public void deleteStudent(String sno);
	public void insertStudent(StudentVo studentVo);
	public void modifyStudent(StudentVo studentVo);
	public StudentVo selectBySno(String sno);
}
