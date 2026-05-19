<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	List<String> images=new ArrayList();
	images.add("../img/m1.jpg");
	images.add("../img/m2.jpg");
	images.add("../img/m3.jpg");
	images.add("../img/m4.jpg");
	images.add("../img/m5.jpg");
	
	List<String> key=new ArrayList();
	key.add("a");
	key.add("b");
	key.add("c");
	key.add("d");
	key.add("e");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.wrap{
	width: 900px;
	height: 900px;
	border: 1px solid red;
	position: absolute;
}
img {
	width: 200px;
	height: 200px;
	position: absolute;
}
.a{
	top: 0px;
	left: 0px;
}
.b{
	top: 0px;
	right: 0px;
}
.c{
	bottom: 0px;
	left: 0px;
}
.d{
	bottom: 0px;
	right: 0px;
}
.e{
	top:350px;
	left:350px;
}
</style>
</head>
<body>
	<h1>Absolute</h1>
	<div class="wrap">
		<%
			for(int i=0;i<images.size();i++){
		%>
			<img src="<%=images.get(i)%>" class="<%=key.get(i)%>">
		<%
			} 
		%>
	</div>
</body>
</html>