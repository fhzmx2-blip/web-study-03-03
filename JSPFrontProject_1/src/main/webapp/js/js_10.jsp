<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=()=>{
	const sawon={"sabun":1,"name":"홍길동","job":"사원"};
	
	document.write("<h1>자바 스크립트 객체 표현법 (JSON)</h1>")
	document.write("사번:"+sawon.sabun+"<p>")
	document.write("이름:"+sawon.name+"<p>")
	document.write("직위:"+sawon.job+"<p>")
	document.write("<hr>")
	document.write("<h1>자바 스크립트 객체 표현법 (JSON)</h1>")
	document.write("사번:"+sawon['sabun']+"<p>")
	document.write("이름:"+sawon['name']+"<p>")
	document.write("직위:"+sawon['job']+"<p>")
	document.write("<hr>")
}
</script>
</body>
</html>