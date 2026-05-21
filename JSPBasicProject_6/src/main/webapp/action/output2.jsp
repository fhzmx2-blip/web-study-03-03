<%@page import="com.sist.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String content=request.getParameter("content");
	
	MemberBean bean = new MemberBean();
	
	bean.setName(request.getParameter("name"));
    bean.setSex(request.getParameter("sex"));
    bean.setAddress(request.getParameter("address"));
    bean.setPhone(request.getParameter("phone"));
    bean.setContent(request.getParameter("content"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>받은 데이터</h1>
	이름: <%=bean.getName() %><br>
	성별: <%=bean.getSex() %><br>
	주소: <%=bean.getAddress() %><br>
	전화: <%=bean.getPhone() %><br>
	소개: <%=bean.getContent() %><br>
</body>
</html>