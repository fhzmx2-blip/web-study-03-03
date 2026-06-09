<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	width: 350px;
	margin: 0px auto;
}
</style>
<script type="text/javascript">
let index=1
let isSwitchOn = false;
let autoSkip = null;

let prev=()=>{
	index--
	if(index<1) index=7
	let img=document.querySelector("img")
	let path="../img/m"+index+".jpg"
	img.src=path
}
let next=()=>{
	index++
	if(index>7) index=1
	let img=document.querySelector("img")
	let path="../img/m"+index+".jpg"
	img.src=path
}
let auto=()=>{	
	if(isSwitchOn == false){
		isSwitchOn = true
		autoSkip=setInterval(()=>{
			next()
		},1000)
	} else if(isSwitchOn == true){
		isSwitchOn = false
		clearInterval(autoSkip)
	}
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
						<img src="../img/m1.jpg" style="width:320px;height:420px;object-fit:cover">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<button class="btn-sm btn-danger" onclick="prev()">이전</button>
    					<button class="btn-sm btn-info" onclick="next()">다음</button>
    					<button class="btn-sm btn-warning" onclick="auto()">자동</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>