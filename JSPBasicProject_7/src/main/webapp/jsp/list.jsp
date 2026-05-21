<%@page import="java.util.*"%>
<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmpDAO dao=EmpDAO.newInstance();
	List<EmpBean> list=dao.empListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원목록</h1>
	<table border=1 bordercolor=black width=500>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직위</th>
			<th>입사일</th>
			<th>급여</th>
		</tr>
		<%
			for(EmpBean vo:list){
		%>
			<tr>
			<td><%=vo.getEmpno() %></td>
			<td><%=vo.getEname() %></td>
			<td><%=vo.getJob() %></td>
			<td><%=vo.getDbday() %></td>
			<td><%=vo.getSal() %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>