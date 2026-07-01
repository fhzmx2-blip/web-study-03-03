<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="app">
		<button @click="count++">
			count
		</button>
		
		<button @click="name='Hong'">
			이름 변경
		</button>
		<div v-memo="[name]">
			<h3>{{name}}</h3>
			<h3>{{count}}</h3>
		</div>
		
		<h3>{{name}}</h3>
		<h3>{{count}}</h3>
	</div>
	<script>
		let app=Vue.createApp({
			data(){
				return{
					name: 'Shim',
					count:0
				}
			}
		}).mount('.app')
	</script>
</body>
</html>