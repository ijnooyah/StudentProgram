package com.yj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yj.dao.StudentDao;
import com.yj.vo.StudentVo;

public class StudentListService implements IStudentService {
	private StudentDao dao = StudentDao.getInstance();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<StudentVo> list = dao.getStudentList();
		request.setAttribute("list", list);
		return "student/student_list";
	}

}
