package com.yj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.yj.dao.ConsultDao;
import com.yj.vo.ConsultVo;

public class ConsultListService implements IStudentService {
	private ConsultDao dao = ConsultDao.getInstance();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sno = request.getParameter("sno");
		System.out.println("sno:" + sno);
		List<ConsultVo> list = dao.getConsultList(sno);
		System.out.println("list:" + list);
		JSONArray jsonArray = new JSONArray(); 
		for (ConsultVo consultVo : list) { 
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("c_no", consultVo.getC_no()); 
			jsonObject.put("sno", sno); 
			jsonObject.put("c_content", consultVo.getC_content());
			jsonObject.put("c_date", consultVo.getC_date());
			jsonArray.add(jsonObject);
		}
		String data = jsonArray.toJSONString();
		System.out.println("data: " + data);
		request.setAttribute("data", data);
		return IStudentService.DATA;
	}

}
