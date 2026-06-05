<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
<script type="text/javascript">
window.onload=function(){
	let a=10
	document.write("<h1> 증가전:"+a+"</h1>")
	a++
	document.write("<h1> 증가후:"+a+"</h1>")
	document.write("<h1> 감소전:"+a+"</h1>")
	a--
	document.write("<h1> 감소후:"+a+"</h1>")
	
	document.write("<hr>")
	
	a=10
	let b=a++
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> b="+b+"</h1>")
	
	a=10
	b=++a
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> b="+b+"</h1>")
	
	document.write("<hr>")
	
	let c=true
	document.write("c="+c+"<br>")
	c=!c
	document.write("c="+c+"<br>")
	
	c=0
	document.write("c="+c+"<br>")
	c=!c
	document.write("c="+c+"<br>")
	
	document.write("<hr>")
	let a1=10
	document.write("a1="+a1+",type="+typeof a1)
	a1=String(a1)
	document.write("a1="+a1+",type="+typeof a1)
	//a1=parseInt(a1)
	a1=Number(a1)
	document.write("a1="+a1+",type="+typeof a1)
	
	document.write("<hr>")
	
	document.write("Boolean(1)="+Boolean(1)+",type="+typeof Boolean(1)+"<P>")
	document.write("Boolean(0)="+Boolean(0)+",type="+typeof Boolean(0)+"<P>")
	document.write("Boolean(0.1)="+Boolean(0.1)+",type="+typeof Boolean(0.1)+"<P>")
	document.write("Boolean(0.0)="+Boolean(0.0)+",type="+typeof Boolean(0.0)+"<P>")
	
	document.write("Boolean('Hello JavaScript')="
			+Boolean('Hello JavaScript')+",type="+typeof Boolean('Hello JavaScript')+"<P>")
	document.write("Boolean('')="+Boolean('')+",type="+typeof Boolean('')+"<P>")
	document.write("Boolean(\"\")="+Boolean("")+",type="+typeof Boolean("")+"<P>")
	
	
}
</script>
 --%>
 <script type="text/javascript">
 function calc() {
	let f=document.getElementById("first").value
	let s=document.getElementById("second").value
	console.log("f="+f+",type="+typeof f)
	console.log("s="+s+",type="+typeof s)
	let span=document.getElementById("result")
	//span.innerHTML="<h2>"+(Number(f)+Number(s))+"</h2>"
	span.innerHTML="<h2>"+(parseInt(f)+parseInt(s))+"</h2>"
}
 </script>
</head>
<body>
	첫번째 값: <input type=text id="first" size=10><br>
	두번째 값: <input type=text id="second" size=10><br>
	<input type=button value="계산" onclick="calc()"><br>
	<span id="result"></span>
	
</body>
</html>