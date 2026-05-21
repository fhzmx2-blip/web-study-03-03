<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.*"%>
<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String address=request.getParameter("addresss");
	if(address==null){
		address="마포";
	}
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	
	int curpage=Integer.parseInt(strPage);
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodFindData(curpage, address);
	int totalpage=dao.foodFindTotalPage(address);
	
	Map map=new HashMap();
	map.put("curpage", curpage);
	map.put("totalpage", totalpage);
	map.put("list",list);
	
	ObjectMapper mapper=new ObjectMapper();
	String json=mapper.writeValueAsString(map);
%>
<%=json%>