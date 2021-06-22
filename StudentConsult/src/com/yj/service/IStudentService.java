package com.yj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IStudentService {
	public static final String REDIRECT = "redirect:";
	public static final String DATA = "data:";
			
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
