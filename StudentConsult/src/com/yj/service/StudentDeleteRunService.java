package com.yj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yj.dao.StudentDao;


public class StudentDeleteRunService implements IStudentService {
	private StudentDao dao = StudentDao.getInstance();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sno = request.getParameter("sno");
		boolean result = dao.deleteStudent(sno);
		HttpSession session = request.getSession();
		session.setAttribute("resultDelete", result);
		return IStudentService.REDIRECT + "StudentList.kh";
	}
	

}
