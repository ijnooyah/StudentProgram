package com.kh.studentInfo01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.studentInfo01.domain.StudentVo;
import com.kh.studentInfo01.persitence.StudentDao;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Inject
	StudentDao studentDao;
	
	@Override
	public List<StudentVo> selectAll() {
		List<StudentVo> list = studentDao.selectAll();
		return list;
	}

	@Override
	public void deleteStudent(String sno) {
		studentDao.deleteStudent(sno);
	}

	@Override
	public void insertStudent(StudentVo studentVo) {
		studentDao.insertStudent(studentVo);
		
	}

	@Override
	public void modifyStudent(StudentVo studentVo) {
		studentDao.modifyStudent(studentVo);
		
	}

	@Override
	public StudentVo selectBySno(String sno) {
		StudentVo studentVo = studentDao.selectBySno(sno);
		return studentVo;
	}

}
