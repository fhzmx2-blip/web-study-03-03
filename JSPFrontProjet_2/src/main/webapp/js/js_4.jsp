<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let a=document.getElementById("a")
	a.textContent="<font color=red>문자 조작</font>"
	let b=document.getElementById("b")
	b.innerHTML="<font color=red>문자 조작</font>"
	
	let btn=document.querySelectorAll("button")
	btn[0].textContent="취소"
	btn[1].style.backgroundColor="yellow"
	
	document.body.style.backgroundColor='pink'
}
</script>
</head>
<body>
	<button type="button">삭제</button>
	<button type="button">HTML 추가</button>
	<h1 id="a">Hello 문자 조작(textContent)</h1>
	<h1 id="b">Hello 문자 조작(innerHTML)</h1>
</body>
</html>