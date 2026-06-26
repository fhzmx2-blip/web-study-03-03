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
			<h3>내용보기</h3>
			<table class="table">
				<tbody>
					<tr>
						<th width=20% class="danger text-center">번호</th>
						<td width=30% class="text-center">{{detail.no}}</td>
						<th width=20% class="danger text-center">작성일</th>
						<td width=30% class="text-center">{{detail.dbday}}</td>
					</tr>
					<tr>
						<th width=20% class="danger text-center">이름</th>
						<td width=30% class="text-center">{{detail.name}}</td>
						<th width=20% class="danger text-center">조회수</th>
						<td width=30% class="text-center">{{detail.hit}}</td>
					</tr>
					<tr>
						<th width=20% class="danger text-center">제목</th>
						<td colspan="3">{{detail.subject}}</td>

					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
							<pre style="white-space:pre-wrap;background: white;border: none">{{detail.content}}</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a :href="'../board/update.do?no='+no" class="btn btn-xs btn-warning">수정</a>
							<span class="btn btn-xs btn-warning" @click="btnClick()">{{isOn?'삭제':'취소'}}</span>
							<a href="../board/list.do" class="btn btn-xs btn-warning">목록</a>
						</td>
					</tr>
					<tr v-show="bShow">
						<td colspan="4" class="text-right">
						비밀번호:<input type="password" size=15 class="input-sm" ref="pwdRef" v-model="pwd">
								<button class="btn-sm btn-primary" @click="del()">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		const detailApp=Vue.createApp({
			data(){
				return{
					bShow:false,
					msg:'삭제',
					isOn:true,
					pwd:'',
					detail:{},
					no:'${param.no}'
				}
			},
			mounted(){
				axios.get('../board/detail_vue.do',{
					params:{
						no:this.no
					}
				}).then(response=>{
					this.detail=response.data
					console.log(response.data)
				})
			},
			methods:{
				btnClick(){
					this.isOn=!this.isOn
					this.bShow=!this.bShow
				},
				del(){
					if(this.pwd.trim()===""){
						this.$refs.pwdRef.focus()
						return
					}
					axios.get('../board/delete_vue.do',{
						params:{
							no:this.no,
							pwd:this.pwd
						}
					}).then(response=>{
						if(response.data==='yes'){
							window.location.href="../board/list.do"
						}
						else{
							alert("비밀번호가 틀립니다")
							this.pwd=''
							this.$refs.pwdRef.focus()
						}
					})
				}
			}
		}).mount(".container")
	</script>
</body>
</html>