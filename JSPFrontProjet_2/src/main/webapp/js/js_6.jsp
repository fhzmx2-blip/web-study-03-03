<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let img=document.querySelector("img")
	img.onmouseover=function(){
		img.style.cursor="pointer"
		img.style.opacity=0.3
	}
	img.onmouseout=function(){
		img.style.opacity=1.0
	}
	
	let btn=document.querySelectorAll("button")
	btn[0].onclick=function(){
		img.style.width="350px"
		img.style.height="450px"
	}
	btn[1].onclick=function(){
		img.style.width="200px"
		img.style.height="250px"
	}
}
</script>
</head>
<body>
	<h1>고전 이벤트 처리</h1>
	<img src="../img/m1.jpg" width="200" height="250">
	<p>
	<button>클릭</button>
	<button>원상복귀</button>
</body>
</html>