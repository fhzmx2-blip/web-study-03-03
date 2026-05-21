<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 버퍼 크기: <%=out.getBufferSize() %></h3>
	<h3>남아있는 버퍼: <%=out.getRemaining() %></h3>
	<h3>사용 중인 버퍼: <%=out.getBufferSize()-out.getRemaining() %></h3>
	<%
		int a=10;
	if(a%2==0){
	%>
	짝수입니다
	<%
	}
	else{
	%>
	홀수입니다
	<%
	}
	%>
	<p>
	<%
	int b=11;
	if(b%2==0){
		out.write("짝수입니다");
	} else {
		out.write("홀수입니다");
	}
	%>
	<p>
	<%
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	out.println("<h1>JSP</h1>");
	%>
</body>
</html>