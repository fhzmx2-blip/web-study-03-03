<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date= new Date();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(date);
	%>
	오늘날짜:<%=today %>
	<h1>jstl</h1>
	<c:set var="today" value="<%=new Date() %>"/>
	오늘 날짜:<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/> 
	
	<h1>java 숫자 변환</h1>
	<%
		int won=1234567;
		DecimalFormat df= new DecimalFormat("##,###,###");
		String data=df.format(won);
	%>
	<%= data %>
	<h1>jstl 숫자 변환</h1>
	<fmt:formatNumber value="1234567" type="currency"/>
</body>
</html>