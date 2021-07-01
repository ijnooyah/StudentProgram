package com.kh.studentInfo01.persitence;

import java.util.List;

import com.kh.studentInfo01.domain.ConsultVo;

public interface ConsultDao {
	public List<ConsultVo> selectConsultList(String sno);
}
