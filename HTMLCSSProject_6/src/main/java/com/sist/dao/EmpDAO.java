package com.sist.dao;

import java.util.*;
import java.sql.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public EmpDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception ex) {
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	
	
	
	
	
	/*
	 * 이름       널?       유형           
	-------- -------- ------------ 
	EMPNO    NOT NULL NUMBER       
	ENAME    NOT NULL VARCHAR2(50) 
	JOB      NOT NULL VARCHAR2(50) 
	HIREDATE NOT NULL DATE         
	SAL      NOT NULL NUMBER(10,2) 
	DEPTNO   NOT NULL NUMBER       
	ISADMIN           CHAR(1)      
	 */
	
	public List<EmpVO> boardListData(int page) {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, TO_CHAR(hiredate, 'yyyy-mm-dd'), sal " + "FROM emp2 "
					+ "ORDER BY empno DESC " + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page * 10) - 10);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getString(4));
				vo.setSal(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	public int boardRowCount() {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM emp2";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}
}
