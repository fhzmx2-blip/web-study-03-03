<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	BoardDAO dao=new BoardDAO();
	
	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==true){
		response.sendRedirect("list.jsp");
	} else {
%>
		<script>
		alert("비밀번호가 틀립니다");
		history.back();
		</script>
<% 
	}
%>