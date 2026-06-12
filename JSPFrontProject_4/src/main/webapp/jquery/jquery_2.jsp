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
	let h1=document.querySelector("h1")
	let val=h1.textContent
	console.log("h1:"+val)
	
	val=$('h1').text()
	console.log('h1:jquery=>'+val)
	
	//h1.textContent="바닐라 JS 이용"
	$('h1').text("Jquery JS 이용")
	
	let h2=document.querySelector("h2")
	h2.innerHTML='<font color=red>순수 자바 스크립트</font>'
	
	$('h2').html('<font color=green>Jquery 사용1</font>')
	$('h2').html('<font color=blue>Jquery 사용2</font>')
	alert($('div').html())
})
</script>
</head>
<body>
	<h1>Hello Jquery</h1>
	<h2>Hello Jquery</h2>
	<h3>Hello Jquery</h3>
	<h4>Hello Jquery</h4>
	<h5>Hello Jquery</h5>
	<div>
		<h6>Div안에 h1</h6>
		<h6>Div안에 h2</h6>
		<h6>Div안에 h3</h6>
	</div>
</body>
</html>
