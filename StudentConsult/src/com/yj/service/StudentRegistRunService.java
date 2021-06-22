package com.yj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yj.dao.StudentDao;
import com.yj.vo.StudentVo;

public class StudentRegistRunService implements IStudentService {
	private StudentDao dao = StudentDao.getInstance();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		int syear = Integer.parseInt(request.getParameter("syear"));
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		int score = Integer.parseInt(request.getParameter("score"));
		StudentVo vo = new StudentVo(sno, sname, syear, gender, major, score);
		boolean result = dao.insertStudent(vo);
		HttpSession session = request.getSession();
		session.setAttribute("resultInsert", result);
		return IStudentService.REDIRECT + "/StudentList.kh";
	}

}
