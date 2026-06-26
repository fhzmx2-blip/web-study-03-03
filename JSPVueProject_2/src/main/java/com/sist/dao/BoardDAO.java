package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static List<BoardVO> boardListData(int start){
		SqlSession session=ssf.openSession();
		List<BoardVO> list=session.selectList("boardListData",start);
		session.close();
		return list;
	}
	
	public static int boardRowCount(){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close();
		return count;
	}
	
	public static void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("boardInsert",vo);
		session.commit();
		session.close();
	}
	
	public static BoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("hitIncrement", no);
	    session.commit();
		BoardVO vo=session.selectOne("boardDetailData", no);
		session.close();
		return vo;
	}
	
	public static boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession(true);
		String db_pwd=session.selectOne("boardGetPassword",no);
		if(db_pwd.equals(pwd)) {
			bCheck=true;
			session.delete("boardDelete",no);
		}
		session.close();
		return bCheck;
	}
	
	public static BoardVO boardUpdateData(int no) {
		SqlSession session=ssf.openSession();
		BoardVO vo=session.selectOne("",no);
		session.close();
		return vo;
	}
	
	public static boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession(true);
		String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			session.update("boardUpdate",vo);
		}
		session.close();
		return bCheck;
	}
}
