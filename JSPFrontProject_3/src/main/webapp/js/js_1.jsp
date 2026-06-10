<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 960px;
}
</style>
<script type="text/javascript">

function total(){
	let kor=document.getElementById("kor").value
	let eng=document.getElementById("eng").value
	let math=document.getElementById("math").value
	
	let total=document.getElementById("total")
	total.innerHTML=parseInt(kor)+parseInt(eng)+parseInt(math)
}

function avg(){
	let kor=document.getElementById("kor").value
	let eng=document.getElementById("eng").value
	let math=document.getElementById("math").value
	
	let avg=document.getElementById("avg")
	avg.innerHTML=(parseInt(kor)+parseInt(eng)+parseInt(math))/3.0
}

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>성적 계산</h1>
			<table>
				<tr>
					<th style="width:25%">국어</th>
					<td style="width:75%">
					<input type=number id="kor" size=10>
					</td>
				</tr>
				<tr>
					<th style="width:25%">수학</th>
					<td style="width:75%">
					<input type=number id="math" size=10>
					</td>
				</tr>
				<tr>
					<th style="width:25%">영어</th>
					<td style="width:75%">
					<input type=number id="eng" size=10>
					</td>
				</tr>
			</table>
			<button onclick="total()">총점</button>
			<span id="total"></span>
			<br>
			<button onclick="avg()">평균</button>
			<span id="avg"></span>
			
		</div>
	</div>
</body>
</html>