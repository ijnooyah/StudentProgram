package com.yj.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yj.dao.StudentDao;

/**
 * Servlet implementation class CheckDupSno
 */
@WebServlet("/CheckDupSno.kh")
public class CheckDupSno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String sno = request.getParameter("sno");
		StudentDao dao = StudentDao.getInstance();
		boolean result = dao.checkDupSno(sno);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}


}
