package com.kh.studentInfo01.persitence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.studentInfo01.domain.StudentVo;

@Repository
public class StudentDaoImpl implements StudentDao {
	
	private static final String NAMESPACE = "com.kh.studentInfo01.student.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<StudentVo> selectAll() {
		List<StudentVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}

	@Override
	public void deleteStudent(String sno) {
		sqlSession.delete(NAMESPACE + "deleteStudent", sno);
	}

	@Override
	public void insertStudent(StudentVo studentVo) {
		sqlSession.insert(NAMESPACE + "insertStudent", studentVo);
		
	}

	@Override
	public void modifyStudent(StudentVo studentVo) {
		sqlSession.update(NAMESPACE + "modifyStudent", studentVo); 
		
	}

	@Override
	public StudentVo selectBySno(String sno) {
		StudentVo studentVo = sqlSession.selectOne(NAMESPACE + "selectBySno", sno);
		return studentVo;
	}

}
