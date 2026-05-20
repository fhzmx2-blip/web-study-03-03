<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	for (int i = 1; i <= 10; i++) {
	%>
	<%=i%>&nbsp;
	<%
	}
	%>
	<h1>JSTL</h1>
	<c:forEach var="i" begin="1" end="10" step="1">
	${i }&nbsp;
	</c:forEach>
</body>
</html>