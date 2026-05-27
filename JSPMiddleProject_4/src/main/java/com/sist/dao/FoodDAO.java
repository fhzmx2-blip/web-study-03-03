package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
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

	public static FoodDAO newInstance() {
		if (dao == null)
			dao = new FoodDAO();
		return dao;
	}

	public int foodTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) " + "FROM food";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}

	public List<FoodVO> foodListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql = "SELECT no,poster,name " + "FROM food " + "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page * 12) - 12);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
}
