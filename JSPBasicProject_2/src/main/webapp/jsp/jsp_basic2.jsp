<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: sans-serif, Arial;
	margin: 20px;
}
h2 {
	margin-top: 40px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
}
.exam {
	margin: 10px 0px;
	padding: 5px;
	border-left: 4px solid #888;
}
</style>
</head>
<body>
	<%
		String title="글자 속성";
		String h2="글자 색상";
		String[] colors={"red","blue","green"};
	%>
	<h1><%=title %></h1>
	<h2><%= h2 %></h2>
	<p class="exam" style="color:red"><%=colors[0] %></p>
	<p class="exam" style="color:#0000FF"><%=colors[1] %></p>
	<p class="exam" style="color:rgb(0,255,0)"><%=colors[2] %></p>
	<%
		h2="글자 크기(font-size)";
		String[] sizes={"12px","20px","2em","150%"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="font-size: 12px"><%=sizes[0]%></p>
	<p class="exam" style="font-size: 20px"><%=sizes[1]%></p>
	<p class="exam" style="font-size: 2em"><%=sizes[2]%></p>
	<p class="exam" style="font-size: 150%"><%=sizes[3]%></p>
	<%
		h2="글꼴(font-family)";
		String[] families = {"궁서체","맑은 고딕","구글폰트"};
	%>
	<h2><% out.println(h2); %></h2>
	<p class="exam" style="font-family: 궁서체"><%=families[0]%></p>
	<p class="exam" style="font-family: 맑은 고딕"><%=families[1]%></p>
	<p class="exam" style="font-family: Noto Sans KR"><%=families[2]%></p>
	<%
		h2="폰트 스타일(font-style)";
		String[] style = {"Normal","Italic","Oblique"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="font-style: Normal"><%=style[0]%></p>
	<p class="exam" style="font-style: Italic"><%=style[1]%></p>
	<p class="exam" style="font-style: Oblique"><%=style[2]%></p>
	<%
		h2="폰트 스타일(font-style)";
		String[] weight = {"보통","굵은","얇은","아주 굵은"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="font-weight: normal;"><%=weight[0]%></p>
	<p class="exam" style="font-weight: bold"><%=weight[1]%></p>
	<p class="exam" style="font-weight: light"><%=weight[2]%></p>
	<p class="exam" style="font-weight: 900"><%=weight[3]%></p>
	<%
		h2="정렬 (text-align)";
		String[] sort = {"왼쪽","가운데","오른쪽","양쪽"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="text-align: left;"><%=sort[0]%></p>
	<p class="exam" style="text-align: center"><%=sort[1]%></p>
	<p class="exam" style="text-align: right"><%=sort[2]%></p>
	<p class="exam" style="text-align: justif"><%=sort[3]%></p>
	<%
		h2="선 (text-decoration)";
		String[] line = {"없음","밑줄","윗줄","취소선"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="text-decoration: noe;"><%=line[0]%></p>
	<p class="exam" style="text-decoration: underline"><%=line[1]%></p>
	<p class="exam" style="text-decoration: overline"><%=line[2]%></p>
	<p class="exam" style="text-decoration: line-through"><%=line[3]%></p>
	<%
		h2="글자 간격 (*-spacing)";
		String[] spacing = {"글자 간격 5px","글자 간격 2px","글자 간격 20px"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="letter-spacing: 5px;"><%=spacing[0]%></p>
	<p class="exam" style="letter-spacing: 2px"><%=spacing[1]%></p>
	<p class="exam" style="letter-spacing: 20px"><%=spacing[2]%></p>
	<%
		h2="줄바꿈 (white-space)";
		String[] space = {"normal","nowrap","prewrap","pre-line"};
	%>
	<h2><%= h2 %></h2>
	<p class="exam" style="white-space: normal;"><%=space[0]%></p>
	<p class="exam" style="white-space: nowrap"><%=space[1]%></p>
	<p class="exam" style="white-space: pre-wrap"><%=space[2]%></p>
	<p class="exam" style="white-space: pre-line"><%=space[3]%></p>
</body>
</html>