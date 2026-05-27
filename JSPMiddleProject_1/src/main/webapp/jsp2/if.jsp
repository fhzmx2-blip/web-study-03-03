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
		if (i % 2 == 0) {
	%><%=i%>
	<%
	}
	}
	%>
	<h1>jstl</h1>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${i%2==0}">
		${i }&nbsp;
		</c:if>
	</c:forEach>
</body>
</html>