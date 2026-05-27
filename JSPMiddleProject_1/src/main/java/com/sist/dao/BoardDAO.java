package com.sist.dao;

import java.util.*;
import java.sql.*;
//////// Connection Pool 
import javax.sql.*;

import com.sist.vo.BoardVO;

import javax.naming.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;

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

	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}

	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {

			getConnection();
			String sql = "SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit " + "FROM jspBoard "
					+ "ORDER BY no DESC " + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, (page * 10) - 10);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));

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

	public int boardTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM jspboard";
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

	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO jspboard(name,subject,content,pwd) " + "VALUES(?,?,?,?)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql="UPDATE jspboard SET hit=hit+1 WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			ps.close();
			
			sql = "SELECT no, name,subject,content,hit,TO_CHAR(regdate, 'yyyy-mm-dd') "
					+"FROM jspboard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}

}