package com.sist.dao;

import java.util.*;
import java.sql.*;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static GoodsDAO dao;

	public GoodsDAO() {
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
	
	public static GoodsDAO newInstance() {
		if(dao==null) {
			dao=new GoodsDAO();
		}
		return dao;
	}

	public List<GoodsVO> goodsListData(int page) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			getConnection();
			String sql = "SELECT no,goods_name,goods_poster,goods_price "
					+ "FROM Goods_all "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page * 12) - 12);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				GoodsVO vo = new GoodsVO();
				
				vo.setNo(rs.getInt(1));
				vo.setGoods_name(rs.getString(2));
				vo.setGoods_poster(rs.getString(3));
				vo.setGoods_price(rs.getString(4));
								
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
	
	public int goodsTotalPage()
	   {
		   int total=0;
		   try  {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)  {
			   ex.printStackTrace();
		   }
		   finally  {
			   disConnection();
		   }
		   return total;
	   }
	
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo = new GoodsVO();
		
		try {
			getConnection();
			String sql="UPDATE goods_all SET hit=hit+1 "
						+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no,goods_name,goods_poster,goods_price, "
					+"goods_sub, goods_discount,goods_delivery, "
					+"goods_first_price "
					+"FROM goods_all WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setGoods_name(rs.getString(2));
			vo.setGoods_poster(rs.getString(3));
			vo.setGoods_price(rs.getString(4));
			vo.setGoods_sub(rs.getString(5));
			vo.setGoods_discount(rs.getInt(6));
			vo.setGoods_delivery(rs.getString(7));
			vo.setGoods_first_price(rs.getString(8));
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		
		return vo;
	}
}
