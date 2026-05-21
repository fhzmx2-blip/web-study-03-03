<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<jsp:useBean id="bean" class="com.sist.bean.MemberBean">
	<jsp:setProperty name="bean" property="*"></jsp:setProperty>
</jsp:useBean>
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
	<br>
	나이:<%=bean.getAge() %>
	<h1>받은 데이터 2</h1>
	이름: <jsp:getProperty name="bean" property="name" /><br>
	성별: <jsp:getProperty name="bean" property="sex" /><br>
	주소: <jsp:getProperty name="bean" property="address" /><br>
	전화: <jsp:getProperty name="bean" property="phone" /><br>
	소개: <jsp:getProperty name="bean" property="content" /><br>
	<br>
	나이: <jsp:getProperty name="bean" property="age" /><br>
</body>
</html>