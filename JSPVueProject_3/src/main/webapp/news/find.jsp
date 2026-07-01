<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.new-box{
	width: 400px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 0 10px rega(0,0,0,0.1);
	padding: 20px;	
}
h2{
	text-align: center;
	color:#2536eb;
}
ul{
	list-style: none;
	padding: 0
}
li {
	margin: 10px 0;
	padding: 10px;
	border-bottom: 1px solid #eee;
}
a {
	text-decoration: none;
	color:#333;
}
a:hover{
	color:#2563eb
}
</style>
</head>
<body>
<div class="container">
    <div class="row">
    	<table class="row">
    		<tr>
    			<td>
    				<form method=post action="../news/find.do">
    					<input type=text name=fd size=20 class="input-sm">
    					<button type=submit class="btn-sm btn-danger">검색</button>
    				</form>
    			</td>
    		</tr>
    	</table>
    	<table class="table">
    		<tr>
    			<td>
    				<c:forEach var="vo" items="${list }">
    					<table class="table">
    						<tr>
    							<td style="color:orange;"><a href="${vo.link}" target="_blink">${vo.title }</td>
    						</tr>
    						<tr>
    							<td style="white-space: pre-wrap;">${vo.desc }</td>
    						</tr>
    					</table>
    				</c:forEach>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
</body>
</html>