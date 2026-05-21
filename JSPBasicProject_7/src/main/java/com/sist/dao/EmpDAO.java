package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;
	
	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
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
	
	public static EmpDAO newInstance() {
		if(dao==null) {
			dao=new EmpDAO();
		}
		return dao;
	}
	
	public List<EmpBean> empListData() {
		List<EmpBean> list = new ArrayList<EmpBean>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, TO_CHAR(hiredate, 'yyyy-mm-dd'), sal "
					+ "FROM emp "
					+ "ORDER BY empno ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				EmpBean vo = new EmpBean();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
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
}