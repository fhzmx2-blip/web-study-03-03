<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no=request.getParameter("no");
	Cookie cookie=new Cookie("food_"+no,no);
	cookie.setMaxAge(60*60*24);
	cookie.setPath("/");
	response.addCookie(cookie);
	response.sendRedirect("../main/main.jsp?mode=2&no="+no);
%>