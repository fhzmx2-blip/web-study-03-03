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
			System.out.println(ex.getMessage());
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
	EMPNO                                     NOT NULL NUMBER
 	ENAME                                     NOT NULL VARCHAR2(50)
 	JOB                                       NOT NULL VARCHAR2(50)
 	HIREDATE                                  NOT NULL DATE
 	SAL                                       NOT NULL NUMBER(10,2)
 	DEPTNO                                    NOT NULL NUMBER
 	ISADMIN                                            CHAR(1)
 */
	
	public List<EmpVO> empListData(){
		List<EmpVO> list=new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="SELECT empno, ename, job, TO_CHAR(hiredate, 'yyyy-mm-dd'), sal, deptno, isadmin "
						+"FROM emp2 "
						+"ORDER BY empno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpVO vo=new EmpVO();
				  vo.setEmpno(rs.getInt(1));
				  vo.setEname(rs.getString(2));
				  vo.setJob(rs.getString(3));
				  vo.setDbday(rs.getString(4));
				  vo.setSal(rs.getInt(5));
				  vo.setDeptno(rs.getInt(6));
				  vo.setIsadmin(rs.getString(7));
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
	
	public static void main(String[] args) {
		EmpDAO dao = new EmpDAO();
		List<EmpVO> list=dao.empListData();
		for(EmpVO vo:list) {
			System.out.println(
					
					vo.getEmpno()+" "
					+vo.getEname()+" "
					+vo.getJob()+" "
					+vo.getDbday()+" "
					+vo.getSal()+" "
					+vo.getDeptno()+" "
					+vo.getIsadmin()
					
					);
		}
	}
}
