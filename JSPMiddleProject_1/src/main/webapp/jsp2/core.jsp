<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
	String name="홍길동";
	request.setAttribute("name", name);
%>

<c:set var="name1" value="심청이"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름:${name }<br>
이름:${name1 }
</body>
</html>