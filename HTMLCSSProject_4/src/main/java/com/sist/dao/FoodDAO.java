package com.sist.dao;

import java.util.*;
import java.sql.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public FoodDAO() {
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
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	public int foodTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM food";
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

	public FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		try {
			getConnection();
			String sql = "SELECT no, name, poster, score, type, phone, address, parking, "
					+ "time, content, theme, price " + "FROM food WHERE no=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();

			rs.next();
			vo.setNo(rs.getInt(1));
            vo.setName(rs.getString(2));
            vo.setPoster(rs.getString(3));
            vo.setScore(rs.getDouble(4));
            vo.setType(rs.getString(5));
            vo.setPhone(rs.getString(6));
            vo.setAddress(rs.getString(7));
            vo.setParking(rs.getString(8));
            vo.setTime(rs.getString(9));
            vo.setContent(rs.getString(10));
            vo.setTheme(rs.getString(11));
            vo.setPrice(rs.getString(12));
            rs.close();
		} catch (

		Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;

	}
}
