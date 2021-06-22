package com.yj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yj.service.ConsultListService;
import com.yj.service.IStudentService;
import com.yj.service.StudentDeleteRunService;
import com.yj.service.StudentListService;
import com.yj.service.StudentModifyFormService;
import com.yj.service.StudentModifyRunService;
import com.yj.service.StudentRegistFormService;
import com.yj.service.StudentRegistRunService;



@WebServlet("*.kh")
public class StudentFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PREFIX = "/WEB-INF/views/";
    private static final String SUFFIX = ".jsp";
	private Map<String, IStudentService> commandMap = new HashMap<>();
    public StudentFrontController() {
        super();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	commandMap.put("StudentList.kh", new StudentListService());
    	commandMap.put("StudentRegistForm.kh", new StudentRegistFormService());
    	commandMap.put("StudentRegistRun.kh", new StudentRegistRunService());
    	commandMap.put("StudentModifyForm.kh", new StudentModifyFormService());
    	commandMap.put("StudentModifyRun.kh", new StudentModifyRunService());
    	commandMap.put("StudentDeleteRun.kh", new StudentDeleteRunService());
    	commandMap.put("ConsultList.kh", new ConsultListService());
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = getCommand(request);
		IStudentService service = commandMap.get(command);
		
		String page = "";
		try {
			page = service.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (page.startsWith(IStudentService.REDIRECT)) {
			String rPage = page.substring(IStudentService.REDIRECT.length());
			response.sendRedirect(rPage);
		} else if(page.startsWith(IStudentService.DATA)) {
			response.setContentType("text/plain;charset=utf-8");
			Object data = request.getAttribute("data");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			out.println(data.toString());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(PREFIX + page + SUFFIX);
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String getCommand(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String command = uri.substring(1);
		return command;
	}
}
