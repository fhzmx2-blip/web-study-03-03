package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;

public class DataBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreatSqlSessionFactory.getSsf();
	}
	
	public static List<DataBoardVO> boardListData(int start){
		SqlSession session = ssf.openSession();
		List<DataBoardVO> list = session.selectList("boardListData", start);
		session.close();
		return list;
	}
	
	public static int boardRowCount() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("boardRowCount");
		session.close();
		return total;
	}
	
	public static void boardInsert(DataBoardVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("boardInsert",vo);
		session.close();
	}
	
	public static DataBoardVO boardDetailData(int no) {
		SqlSession session = ssf.openSession();
		session.update("boardHitIncrement",no);
		session.commit();
		DataBoardVO vo=session.selectOne("boardDetailData", no);
		session.close();
		return vo;
	}
	
	public static DataBoardVO boardUpdateData(int no) {
		SqlSession session = ssf.openSession();
		DataBoardVO vo=session.selectOne("boardDetailData", no);
		session.close();
		return vo;
	}
	
	public static boolean boardUpdate(DataBoardVO vo) {
		boolean bCheck=false;
		SqlSession session = ssf.openSession(true);
		String db_pwd=session.selectOne("boardGetPassword", vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			session.update("boardUpdate", vo);
		}
		session.close();
		
		return bCheck;
	}
}
