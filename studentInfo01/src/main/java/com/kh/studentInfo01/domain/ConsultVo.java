package com.kh.studentInfo01.domain;

import java.sql.Timestamp;

public class ConsultVo {
	private int cno;
	private String sno;
	private String c_content;
	private Timestamp c_date;
	
	public ConsultVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ConsultVo(String sno, String c_content) {
		super();
		this.sno = sno;
		this.c_content = c_content;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Timestamp getC_date() {
		return c_date;
	}

	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}

	@Override
	public String toString() {
		return "ConsultVo [cno=" + cno + ", sno=" + sno + ", c_content=" + c_content + ", c_date=" + c_date + "]";
	}
	
	
}
