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
}
