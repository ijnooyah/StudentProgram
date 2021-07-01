package com.kh.studentInfo01.service;

import java.util.List;

import com.kh.studentInfo01.domain.ConsultVo;

public interface ConsultService {
	public List<ConsultVo> getConsultList(String sno);
}
