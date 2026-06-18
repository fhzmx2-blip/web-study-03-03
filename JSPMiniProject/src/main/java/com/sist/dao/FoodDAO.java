package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreatSqlSessionFactory.getSsf();
	}
	
	public static List<FoodVO> foodListData(int start){
		SqlSession session = ssf.openSession();
		List<FoodVO> list=session.selectList("foodListData",start);
		session.close();		
		return list;
	}
	
	public static int foodTotalPage(){
		SqlSession session = ssf.openSession();
		int totalpage=session.selectOne("foodTotalPage");
		session.close();		
		return totalpage;
	}
	
	public static FoodVO foodDetailData(int no) {
		SqlSession session = ssf.openSession();
		session.update("foodHitIncrement",no);
		FoodVO vo=session.selectOne("foodDetailData",no);
		session.close();		
		return vo;
	}
	
	public static List<FoodVO> foodRearData(String address){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodRearData",address);
		session.close();
		return list;
	}
}
