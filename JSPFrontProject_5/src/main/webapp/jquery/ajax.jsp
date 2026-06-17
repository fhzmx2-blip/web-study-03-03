<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest=null
function getXMLHttpRequest(){
	if(window.XMLHttpRequest){
		alert("XMLHttpRequest 생성")
		return new XMLHttpRequest()
	}
	else{
		return null;
	}
}

function sendRequest(url,params,callback,method){
	httpRequest=getXMLHttpRequest()
	let httpMethod=method?method:'GET'
	if(httpMethod!='GET' && httpMethod!='POST'){
		httpMethod='GET'
	}
	let httpParams=(params===null || params==="")?null:params
	let httpUrl=url
	if(httpMethod==='GET' && httpParams!=null){
		httpUrl=httpUrl+"?"+httpParams
	}
	httpRequest.open(httpMethod,httpUrl,true)
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	httpRequest.onreadystatechange=callback
	httpRequest.send(httpMethod=='POST'?httpParams:null)
}
function send(){
	sendRequest('sub.jsp',null,ok,'POST')
}
function ok(){
	if(httpRequest.readyState===4){
		if(httpRequest.status===200){
			let div=document.querySelector("#print")
			div.innerHTML=httpRequest.responseText
		}
	}
}
</script>
</head>
<body>
	<button onclick="send()">전송</button>
	<div id="print"></div>
</body>
</html>