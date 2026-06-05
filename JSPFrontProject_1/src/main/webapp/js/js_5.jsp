<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	let i=3;
	switch(i){
	case 1: document.write("<h1>문장1</h1>")
	case 2: document.write("<h1>문장2</h1>")
	case 3: document.write("<h1>문장3</h1>")
	}
}
/*
 * 
 * searchMainDailyBoxOffice.do
 * searchMainRealTicket.do
 * searchMainDailySeatTicket.do
 */
function movieList(no){
	let site="https://www.kobis.or.kr/kobis/business/main/";
	if(no===1) site+="searchMainDailyBoxOffice.do"
	if(no===2) site+="searchMainRealTicket.do"
	if(no===3) site+="searchMainDailySeatTicket.do"
	axios.get(site).then(response=>{console.log(response.data)})
	
	
}
</script>
</head>
<body>


</body>
</html>