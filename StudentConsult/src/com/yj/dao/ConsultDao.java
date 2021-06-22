package com.yj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yj.vo.ConsultVo;



public class ConsultDao {
	private static ConsultDao instance = new ConsultDao();
	private ConsultDao() { }
	public static ConsultDao getInstance() {
		return instance;
	}
	
	private final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String ID = "user1001";
	private final String PW = "u1234";
	
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) try { rs.close(); } catch (SQLException e) { }
		if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
		if (conn != null) try { conn.close(); } catch (SQLException e) { }
	}
	
	private Connection getConnection() {
		try {
			Class.forName(DRIVER_NAME);
			Connection conn = DriverManager.getConnection(URL, ID, PW);
			System.out.println(conn);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<ConsultVo> getConsultList(String sno) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_consult"
					+ "   where sno = ?"
					+ "   order by to_date(c_date, 'yyyy-MM-dd') desc"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			List<ConsultVo> list = new ArrayList<>();
			while(rs.next()) {
				int c_no = rs.getInt(1);
				String c_content = rs.getString(3);
				String c_date = rs.getString(4);
				
				ConsultVo vo = new ConsultVo(c_no, sno, c_content, c_date);
				list.add(vo);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}
}
