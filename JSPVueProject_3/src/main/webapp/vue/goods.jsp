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
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<p>단가:{{price.toLocaleString()}}원</p>
			<button class="btn-sm btn-danger" @click="account--" :disabled="account<=1">-</button>
			<span>{{account}}</span>
			<button class="btn-sm btn-primary" @click="account++">+</button>
			<p>총금액: {{totalPrice}}</p>
		</div>
	</div>
	<script>
		let goods=Vue.createApp({
			data(){
				return{
					price:10000,
					account:1	
				}
				
			},
			computed:{
				totalPrice(){
					return (this.price * this.account).toLocaleString()
				}
			},
			watch:{
				account(newVal,oldVal){
					console.log("수량 변경:"+oldVal+"->"+newVal)
				}
			}
		}).mount(".container")
	</script>
</body>
</html>