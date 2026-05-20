<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb" info="지시자 연습파일"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재 사용중인 메모리 크기:<%= out.getBufferSize()-out.getRemaining() %>
</body>
</html>