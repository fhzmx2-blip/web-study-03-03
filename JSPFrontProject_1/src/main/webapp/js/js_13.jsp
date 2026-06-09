<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function plus(a,b){
	return a+b
}
let plus2=function(a,b){
	return a+b
}
let plus3=(a,b)=>{return a+b}
let plus4=(a,b)=>a+b

window.onload=()=>{
	let a=10
	let b=20
	
	let c=plus(a,b)
	let d=plus2(a,b)
	let e=plus3(a,b)
	let f=plus4(a,b)
	
	document.write("c="+c+", type="+typeof plus+"<br>")
	document.write("d="+d+", type="+typeof plus2+"<br>")
	document.write("e="+e+", type="+typeof plus3+"<br>")
	document.write("f="+f+", type="+typeof plus4+"<br>")
	
	func(callback)
	
}
let callback=function(){
	document.write("함수 Call...<br>")
}
function func(call){
	for(let i=1;i<=10;i++){
		call()
	}
}

</script>
</head>
<body>

</body>
</html>