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
.container {
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
<script type="text/javascript"
	src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript"
	src="https://unpkg.com/axios/dist/axios.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>v-for()</h1>
			<table class="table">
				<tbody>
					<tr>
						<td class="text-center">
							<button type="button" class="btn-lg btn-warning"
								@click="select(1)">일별 박스오피스</button>
							<button type="button" class="btn-lg btn-warning"
								@click="select(2)">실시간 예매율</button>
							<button type="button" class="btn-lg btn-warning"
								@click="select(3)">좌석 점유율</button>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th>영화명</th>
						<th>장르</th>
						<th>감독</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="vo in movies">
						<td>{{vo.rank}}</td>
						<td><img v-bind:src="'https://www.kobis.or.kr'+vo.thumbUrl"
							style="width: 30px; height: 30px;"></td>
						<td>{{vo.movieNm}}</td>
						<td>{{vo.genre}}</td>
						<td>{{vo.director}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		let movie=Vue.createApp({
			data(){
				return{
					movies:[],
					no:1
				}
			},
			mounted(){
					axios.get('../movie/list.do', {
		                params: {
		                    no: this.no
		                }
		            }).then(response => {
		                console.log(response.data);
		                this.movies = response.data;
		            })   
		    },
		    methods:{
				   select(no){
					   axios.get('../movie/list.do',{
						   params:{
							   no:no
						   }
					   }).then(response=>{
						   console.log(response.data)
						   this.movies=response.data
					   })
				   }
			   }
		}).mount('.container')
	</script>
</body>
</html>