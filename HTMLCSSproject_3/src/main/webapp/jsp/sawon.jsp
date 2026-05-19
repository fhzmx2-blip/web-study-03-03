<%@page import="java.util.*"%>
<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	JSP (Java Server Page)
--%>
<%
EmpVO dao = new EmpVO();
	List<EmpVO> list=dao.empListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	margin: 100px auto;
	border-collapse: collapse;
	width: 700px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}
thead{
	background-color: #4374D9;
	color: white;
}
th, td{
	padding: 12px 16px;
	text-align: left;
}
tbody tr{
	border-bottom: 1px solid #000000;
}
tbody tr:nth-child(even){
	background-color: #E4E4E4
}
tbody tr:last-child{
	border-bottom: none;
}
tbody tr:hover{
	background-color: #D4F4FA
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직위</th>
				<th>입사일</th>
				<th>급여</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (EmpVO vo:list){
				
		%>
			<tr>
				<td><%= vo.getEmpno() %></td>
				<td><%= vo.getEname() %></td>
				<td><%= vo.getJob() %></td>
				<td><%= vo.getDbday() %></td>
				<td><%= vo.getSal() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>