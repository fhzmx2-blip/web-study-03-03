<%@page import="com.sist.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
String sex=request.getParameter("sex");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String content=request.getParameter("content");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>받은 데이터</h1>
	이름: <%=name %><br>
	성별: <%=sex %><br>
	주소: <%=address %><br>
	전화: <%=phone %><br>
	소개: <%=content %><br>
</body>
</html>