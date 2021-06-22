package com.yj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yj.dao.StudentDao;
import com.yj.vo.StudentVo;

public class StudentModifyFormService implements IStudentService {
	private StudentDao dao = StudentDao.getInstance();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sno = request.getParameter("sno");
		StudentVo studentVo = dao.getOneStudent(sno);
		request.setAttribute("studentVo", studentVo);
		return "student/student_modify_form";
	}

}
