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
h1 {
   text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>Vue 조건문(v-if, v-else, v-else-if)</h3>
			<button type="button" class="btn-sm btn-danger" v-on:click="select(1)">한식</button>
			<button type="button" class="btn-sm btn-success" @click="select(2)">일식</button>
			<button type="button" class="btn-sm btn-warning" @click="select(3)">중식</button>
			<button type="button" class="btn-sm btn-info" @click="select(4)">양식</button>
			<button type="button" class="btn-sm btn-primary" @click="select(5)">기타</button>
		</div>
		<div class="row text-center" style="margin-top: 20px">
			<div v-if="type===0">
				선택한 음식이 없습니다
			</div>
			<div v-else-if="type===1">
				한식 선택
			</div>
			<div v-else-if="type===2">
				일식 선택
			</div>
			<div v-else-if="type===3">
				중식 선택
			</div>
			<div v-else-if="type===4">
				양식 선택
			</div>		
			<div v-else>
				기타 선택
			</div>
			
		</div>
		<div class="row text-center">
			<div class="row text-center" style="margin-top: 10px">
				<button class="btn-lg btn-danger" @click="log()">로그인</button>
				<button class="btn-lg btn-primary" @click="logout()">로그아웃</button>
				<div v-if="login==true">
					<h3>로그인 되었습니다</h3>
				</div>
				<div v-else>
					<h3>로그아웃 되었습니다</h3>
				</div>
			</div>
		</div>
	</div>
	<script>
		let sel=Vue.createApp({
			data(){
				return{
					type:0,
					login:false
				}
			},
			methods:{
				select(type){
					this.type=type
				},
				log(){
					this.login=true
				},
				logout(){
					this.login=false
				}
			}
		}).mount(".container")
	</script>
</body>
</html>