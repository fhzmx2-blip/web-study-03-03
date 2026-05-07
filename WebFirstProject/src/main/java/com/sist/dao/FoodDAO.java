package com.sist.dao;
import java.util.*;

import java.sql.*;
import com.sist.vo.*;
public class FoodDAO {
   // 연결 객체 => 전체에서 사용
   private Connection conn;
   // 송수신 => 전체에서 사용 
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   // 드라이버 등록 
   public FoodDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   // 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 오라클 닫기 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   
   // 목록 출력 
   public List<FoodVO> foodListData(int page)
   {
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT no,name,poster,type,address "
				     +"FROM food "
				     +"ORDER BY no ASC "
				     +"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, (page*20)-20);
		   // 결과값 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO(); // 한줄씩 저장 
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setType(rs.getString(4));
			   vo.setAddress(rs.getString(5));
			   
			   // => 20개를 모아서 => 브라우저에 전송 
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   // 총페이지 
   public int foodTotalPage()
   {
	   int total=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM food";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   
}