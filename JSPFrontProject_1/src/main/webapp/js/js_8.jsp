<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row {
	margin: 0px auto;
	width: 800px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	let arr=[];
	axios.get('js_8.do')
		 .then(response=>{
			 console.log(response)
			 let html=''
			 let data=response.data
			 data.map((emp)=>{
				html+='<tr>'
					+'<td>'+emp.empno+'</td>'
					+'<td>'+emp.ename+'</td>'
					+'<td>'+emp.job+'</td>'
					+'<td>'+emp.dbday+'</td>'
					+'<td>'+emp.dname+'</td>'
					+'<td>'+emp.loc+'</td>'
					+'</tr>'
			})
			let tbody=document.querySelector("tbody")
			tbody.innerHTML=html
		 })
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class ="text-center">사원 목록</h3>
			<table class="table">
				<thead>
					<tr class="danger">
						<th>사번</th>
						<th>이름</th>
						<th>직위</th>
						<th>입사일</th>
						<th>부서명</th>
						<th>근무지</th>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>