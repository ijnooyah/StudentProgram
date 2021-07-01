package com.kh.studentInfo01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.studentInfo01.domain.ConsultVo;
import com.kh.studentInfo01.persitence.ConsultDao;

@Service
public class ConsultServiceImpl implements ConsultService {
	
	@Inject
	private ConsultDao consultDao;
	
	@Override
	public List<ConsultVo> getConsultList(String sno) {
		List<ConsultVo> list = consultDao.selectConsultList(sno);
		return list;
	}

}
