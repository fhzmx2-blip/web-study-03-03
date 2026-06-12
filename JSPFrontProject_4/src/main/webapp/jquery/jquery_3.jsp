<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js">
</script>
<script type="text/javascript">
$(function(){
	$('img').attr('src', 'https://img.megabox.co.kr/SharedImg/2026/05/28/EWuCHtLbifaow6OzleUI5qz6VczYpjxS_420.jpg')
	$("input[type='text']").val("hong")
	$("input[type='password']").val("1234")
	alert($("input[type='text']").val())
	alert($("input[type='password']").val())
})
</script>
</head>
<body>
	<img src=""><br>
	ID:<input type=text id="id" size=15><br>
	PW:<input type=password id="pwd" size=15><br>
</body>
</html>