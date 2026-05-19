<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!int p = 1;

	public int add(int a, int b) {
		return a + b;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int a = 10;
	int b = 20;
	int c = add(a, b);
	%>
	<%=c%>
	<br>
	<%=p%>
</body>
</html>