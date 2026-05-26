package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import com.sist.vo.MemberVO;
import javax.naming.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao;

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

	public static MemberDAO newInstance() {
		if (dao == null)
			dao = new MemberDAO();
		return dao;
	}

	public MemberVO memberLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM member " + "WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			rs.close();

			if (count == 0) {
				vo.setMsg("NOID");
			} else {
				sql = "SELECT id,name,pwd,isadmin,post,addr1,addr2,phone " + "FROM member " + "WHERE id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				rs.next();
				String db_id = rs.getString(1);
				String name = rs.getString(2);
				String db_pwd = rs.getString(3);
				String isadmin = rs.getString(4);
				String post = rs.getString(5);
				String addr1 = rs.getString(6);
				String addr2 = rs.getString(7);
				String phone = rs.getString(8);

				if (pwd.equals(db_pwd)) {

					vo.setId(db_id);
					vo.setIsadmin(isadmin);
					vo.setName(name);
					vo.setPhone(phone);
					vo.setAddr1(addr1);
					vo.setAddr2(addr2);
					vo.setPost(post);
					vo.setMsg("OK");
				} else {
					vo.setMsg("NOPWD");
				}
				rs.close();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
}
