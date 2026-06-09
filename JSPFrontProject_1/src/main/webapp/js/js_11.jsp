<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let names=["홍길동","심청이","박문수","이순신","춘향이"]
	document.write("<h3>원본배열</h3>")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	names.push("을지문덕")
	document.write("<h3>배열추가</h3>")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	document.write("<h3>배열삭제 : pop(마지막) shift(처음)</h3>")
	//names.pop() 마지막 데이터 삭제
	names.shift() //첫번째 데이터 삭제
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	document.write("<h3>배열자르기 : slice(start):새로운 배열 생성</h3>")
	let names2=names.slice(2)
	document.write("<ul>")
	names2.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names2.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	document.write("<h3>배열자르기 : slice(start, end):새로운 배열 생성</h3>")
	let names3=names.slice(1,3)
	document.write("<ul>")
	names3.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names3.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	document.write("<h3>복사...</h3>")
	let names4=["...names","춘향이"]
	document.write("<ul>")
	names3.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원: "+names3.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
}
</script>
</head>
<body>

</body>
</html>