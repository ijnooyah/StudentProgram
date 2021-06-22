package com.yj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yj.vo.StudentVo;

public class StudentDao {
	private static StudentDao instance = new StudentDao();
	private StudentDao() { }
	public static StudentDao getInstance() {
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
	
	public List<StudentVo> getStudentList() {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_student"
					+ "   order by sno"; 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<StudentVo> list = new ArrayList<>();
			while(rs.next()) {
				String sno = rs.getString(1);
				String sname = rs.getString(2);
				int syear = rs.getInt(3);
				String gender = rs.getString(4);
				String major = rs.getString(5);
				int score = rs.getInt(6);
				
				StudentVo vo = new StudentVo(sno, sname, syear, gender, major, score);
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
	
	public boolean deleteStudent(String sno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from tbl_student"
					+ "   where sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sno);
			pstmt.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
		return false;
	}
	
	public boolean insertStudent(StudentVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tbl_student"
					+ "   values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSno());
			pstmt.setString(2, vo.getSname());
			pstmt.setInt(3, vo.getSyear());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getMajor());
			pstmt.setInt(6, vo.getScore());
			
			pstmt.executeUpdate();
			return true;
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
		return false;
	}
	
	public StudentVo getOneStudent(String sno) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_student"
					+ "	  where sno = '" + sno +"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sname = rs.getString(2);
				int syear = rs.getInt(3);
				String gender = rs.getString(4);
				String major = rs.getString(5);
				int score = rs.getInt(6);
				StudentVo vo = new StudentVo(sno, sname, syear, gender, major, score);

				return vo;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}
	
	public boolean updateStudent(StudentVo vo) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			String sql = "update tbl_student"
					+ "   set sname = ?, syear = ?, gender = ?, major = ?, score = ?"
					+ "   where sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSname());
			pstmt.setInt(2, vo.getSyear());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getMajor());
			pstmt.setInt(5, vo.getScore());
			pstmt.setString(6, vo.getSno());
			
			pstmt.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
		return false;
	}
	
	public boolean checkDupSno(String sno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from tbl_student"
					+ "   where sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0) {
					return true;
				}
			}
 		} catch(Exception e) {
 			e.printStackTrace();
  		} finally {
  			closeAll(rs, pstmt, conn);
  		}
		return false;
	}
}
