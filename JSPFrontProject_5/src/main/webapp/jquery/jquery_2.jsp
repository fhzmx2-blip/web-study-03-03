<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').hover(function(){
		$(this).css({
			'opacity':0.3,
			'cursor':'pointer',
			'border':'2px solid green'
			})
	}, function(){
		$(this).css({
			'opacity':1.0,
			'cursor':'none',
			'border':'none'
			})
	})
	
	$('li').on('click', function(){
		let data=$(this).text()
		alert("선택된 과정: ("+data+")")
		$(this).text(data+"과정")
	})
	
	$('#readBtn').on('click',function(){
		let msg=$('#msg').val()
		let sel=$('#sel').val()
		let t=$('textarea').val()
		alert("text: "+msg+"\nselect: "+sel+"\ntextarea: "+t)
		
	})
	
	$('#writeBtn').on('click',function(){
		$('#msg').val("Hello Spring")
		$('#sel').val("프론트엔드")
		$('textarea').val("안녕하세요")
		
	})
	
	$('#htmlBtn').on('click',function(){
		$('#html').html('<font color=red>Hello HTML</font>')
		
	})
})
</script>
</head>
<body>
	<h1>이미지 스타일 변경</h1>
	<img src="../img/m1.jpg" style="width:150px;height:200px">
	<img src="../img/m2.jpg" style="width:150px;height:200px">
	<h1>this 사용</h1>
	<ul>
		<li>자바: JSP/JDBC/Spring/Spring-Boot</li>
		<li>오라클: 데이터 저장 공간</li>
		<li>HTML/CSS: 화면</li>
	</ul>
	<h1>val() / 입력창</h1>
	<input type="button" value="읽기" id="readBtn">
	<input type="button" value="쓰기" id="writeBtn">
	<input type="button" value="HTML" id="htmlBtn">	<br>
	<input type="text" id="msg" size=20><br>
	<select id="sel">
		<option>백엔드</option>
		<option>프론트엔드</option>
		<option>데이터베이스</option>
	</select><br>
	<textarea rows="3" cols="20">Hello</textarea>
	<br>
	<span id="html"></span>
</body>
</html>