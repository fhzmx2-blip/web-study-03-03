<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("name", "홍길동");
		session.setAttribute("name", "심청이");
		application.setAttribute("name", "박문수");
	%>
	이름:${ name }<br>
	이름:${ name }<br>
	이름:${ name }<br>
</body>
</html>