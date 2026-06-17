<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
.menu {
	display: flex;
	list-style: none;
	background-color: #333;
	color:white;
}
.menu li{
	padding: 15px 25px
}
.menu li.active{
	background:#2196F3
}
.content{
	display:none;
	padding:20px;
	border: 1px solid #ddd;
}
.content.active{
	display: block;
}
</style>
<script type="text/javascript">
$(function(){
	$('.menu li').on('click',function(){
		$('.menu li').removeClass('active')
		$(this).addClass('active')
		
		$('.content').removeClass('active')
		
		const tab=$(this).attr('data-tab')
		$('#tab'+tab).addClass('active')
	})
})
	
</script>
</head>
<body>
	<ul class="menu">
		<li class="active" data-tab="1">홈</li>
		<li data-tab="2">회원</li>
		<li data-tab="3">묻고답하기</li>
	</ul>
	<div id="tab1" class="content active">홈 메뉴입니다</div>
	<div id="tab2" class="content">회원 메뉴입니다</div>
	<div id="tab3" class="content">묻고답하기 메뉴입니다</div>
</body>
</html>