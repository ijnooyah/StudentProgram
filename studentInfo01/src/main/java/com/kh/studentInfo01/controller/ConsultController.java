package com.kh.studentInfo01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.studentInfo01.domain.ConsultVo;
import com.kh.studentInfo01.service.ConsultService;

@RestController
@RequestMapping("/consult")
public class ConsultController {
	
	@Inject
	ConsultService consultService;
	
	@RequestMapping(value="/getConsultList", method=RequestMethod.POST)
	public List<ConsultVo> getConsultList(String sno) throws Exception {
		System.out.println(sno);
		List<ConsultVo> list = consultService.getConsultList(sno);
		System.out.println(list);
		return list;
	}
}
