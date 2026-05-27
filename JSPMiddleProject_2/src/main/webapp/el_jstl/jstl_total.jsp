<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%
	List<String> list = new ArrayList<String>();
	list.add("홍길동");
	list.add("심청이");
	list.add("춘향이");
	list.add("박문수");
	list.add("이순신");
	
	request.setAttribute("list1", list);
	session.setAttribute("list2", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<%
	for(String name:list){
%>
<li><%=name %></li>
<%} %>
</ul>

<h1>현대적 방식</h1>
<ul>
<c:forEach var="name" items="${list1}">
	<li>${name}</li>
</c:forEach>
</ul>

<h1>session 출력</h1>
<ul>
<c:forEach var="name" items="${sessionScope.list2}">
	<li>${name}</li>
</c:forEach>
</ul>
<h1>jstl조건문</h1>
<c:forEach var="i" begin="1" end="10">
	<c:choose>
		<c:when test="${i%2==0}">
			<h3>${i+="는 짝수"}</h3>
		</c:when>
		<c:otherwise>
			<h3>${i+="는 홀수"}</h3>
		</c:otherwise>
	</c:choose>
</c:forEach>

<h1>변환:날짜</h1>
<%
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(date);
%>
실제 날짜: <%=date %><br>
오늘 날짜: <%=today %>
<br>
<c:set var="date" value="<%=date %>"/>
오늘 날짜: <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
<h1>변환:숫자</h1>
<c:set var="won" value="1234567"/>
변환: <fmt:formatNumber value="${won }" type="currency"/>
</body>
</html>