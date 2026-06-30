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
  width: 800px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
.a-link:hover{
  cursor: pointer;
}
button{
	margin-left: 2px
}
h3{
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<button class="btn-sm btn-danger">실행</button>
			<p id="print" style="display:none">
				<input type="text" id="name" class="input-sm" size=20 v-model="msg">
				
			</p>	
		</div>
	</div>
	<script>
		let reply=Vue.createApp({
			data(){
				return{
					msg:'홍길동',
					no:0
				}
			},
			mounted(){
				$('.btn-danger').on('click',function(){
					if(this.no===0){
						$('#print').show()
						$('.btn-danger').text("취소")
						this.no=1
					}
					else{
						$('#print').hide()
						$('.btn-danger').text("실행")
						this.no=0
					}
				})
			}
		}).mount(".container")
	</script>
</body>
</html>