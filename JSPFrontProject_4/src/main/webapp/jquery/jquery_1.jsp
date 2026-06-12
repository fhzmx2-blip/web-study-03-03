<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js">
</script>
<script type="text/javascript">
$(function(){
	$('#h1').css("color","yellow")
	$('#h2').css("color","red")
	$('#h3').css("color","blue")
	
	$('h2:eq(0)').css("color","magenta").css("backgroundColor","black")
	$('h2:eq(1)').css({"color":"pink","backgroundColor":"blue"})
	
	$('h2:eq(2)').css("color","green")
	$('h2:eq(3)').css("color","grey")
	$('h2:eq(4)').css("color","cyan")
	
	/*let h3s=document.querySelectorAll("h3")
	for(let h3 of h3s){
		h3.style.backgroundColor='blue'
		h3.style.color="white"
	}*/
	$('h3').css({
		"backgroundColor":"blue",
		"color":"white"
	})
	
	$('img').css({
		"width":"160px",
		"height":"230px"
	})
	
	$('img').hover(function(){
		$(this).css({
			"cursor":"pointer",
			"border":"3px solid green"
		})
	},function(){
		$(this).css({
			"cursor":"none",
			"border":"none"
		})
	})
})
</script>
</head>
<body>
	<h1 id="h1">Hello Jquery</h1>
	<h1 class="h1">Hello Jquery</h1>
	<h1 class="h1">Hello Jquery</h1>
	<h1 id="h2">Hello Jquery</h1>
	<h1 id="h3">Hello Jquery</h1>
	
	<h2>Hello Jquery</h2>
	<h2>Hello Jquery</h2>
	<h2>Hello Jquery</h2>
	<h2>Hello Jquery</h2>
	<h2>Hello Jquery</h2>
	
	<h3>Hello Jquery</h3>
	<h3>Hello Jquery</h3>
	<h3>Hello Jquery</h3>
	<h3>Hello Jquery</h3>
	<h3>Hello Jquery</h3>
	
	<img src="https://img.megabox.co.kr/SharedImg/2026/05/19/Xya2c40b4Yck7jNWa2l0NWUpIuoZkPAV_420.jpg">
	<img src="https://img.megabox.co.kr/SharedImg/2026/05/21/ysq28y1C9Y3yJdnIIwb3kacb7Sx6omLV_420.jpg">
	<img src="https://img.megabox.co.kr/SharedImg/2026/05/28/EWuCHtLbifaow6OzleUI5qz6VczYpjxS_420.jpg">
	<img src="https://img.megabox.co.kr/SharedImg/2026/06/02/1vONm8CrRDYrnqSGbtrXqBoK5aOqwLZQ_420.jpg">
	<img src="https://img.megabox.co.kr/SharedImg/2026/06/01/8YuPu88wP3FuDR0qBn2aH0UzGP8XNd3G_420.jpg">
</body>
</html>