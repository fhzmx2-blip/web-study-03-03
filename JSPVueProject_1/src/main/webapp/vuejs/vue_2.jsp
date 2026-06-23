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
			<input type=text size=20 class="input-sm" v-model="msg">
			<div>{{msg}}</div>
		</div>
	</div>
	<script>
		let con=Vue.createApp({
			data(){
				return{
					msg:''
				}
			},
			beforeCreate(){
				console.log("Vue 객체 생성 전...")
			},
			created(){
				console.log("Vue 객체 생성 완료...")
			},
			beforeMount(){
				console.log("가상돔에 올라가기 전...")
			},
			mounted(){
				console.log("가상돔에 HTML을 트리 형태로 저장 완료...(onload)")
			},
			beforeUpdate(){
				console.log("데이터 갱신 전...")
			},
			updated(){
				console.log("데이터 갱신 완료...***")
			},
			beforeUnmount(){
				console.log("가상돔 해제 전...")
			},
			Unmounted(){
				console.log("가상돔 해제된 상태...")
			}
		}).mount('.container')
	</script>
</body>
</html>