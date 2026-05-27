<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
   List<String> names=new ArrayList<String>();
   names.add("홍길동");
   names.add("심청이");
   names.add("박문수");
   names.add("춘향이");
   names.add("이순신");
%>
<c:set var="list" value="<%=names %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%for(int i=1;i<=10;i++){
		
	%>
	<%=i %>&nbsp;
	<%}%>
	
	<br><h1>요즘방식</h1>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;
	</c:forEach>
</body>
</html>