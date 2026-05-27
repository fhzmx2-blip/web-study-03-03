<%@page import="com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SawonVO vo=new SawonVO();
	vo.setSabun(1);
	vo.setName("홍길동");
	vo.setDept("개발부");
	vo.setJob("사원");
	vo.setLoc("서울");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>과거방식</h1>
 사번: <%=vo.getSabun() %> <br>
 이름: <%=vo.getName() %> <br>
 부서: <%=vo.getDept() %> <br>
 직위: <%=vo.getJob() %> <br>
 근무지: <%=vo.getLoc() %> <br>
 <h1>현재방식</h1>
 <%
 	request.setAttribute("vo", vo);
 %>
 사번: ${vo.getSabun() } <br>
 이름: ${vo.getName() } <br>
 부서: ${vo.getDept() } <br>
 직위: ${vo.getJob() } <br>
 근무지: ${vo.getLoc() } <br>
 <h1>현재방식: 약식</h1>
 사번: ${vo.sabun} <br>
 이름: ${vo.name} <br>
 부서: ${vo.dept} <br>
 직위: ${vo.job} <br>
 근무지: ${vo.loc} <br>
 
</body>
</html>