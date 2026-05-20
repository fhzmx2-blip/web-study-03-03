<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"
    buffer="16kb" info="상품 목록" errorPage="error.jsp"
%>

<%
    String strPage=request.getParameter("page");
    if(strPage==null){
    	strPage="1";
    }
    int curpage=Integer.parseInt(strPage);
    GoodsDAO dao=GoodsDAO.newInstance();
    List<GoodsVO> list=dao.goodsListData(curpage);
    
    
    int totalpage=dao.goodsTotalPage();
    final int BLOCK=10;
    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: sans-serif, Arial;
	padding: 40px;
	background: #f5f5f5;
}
.card-wrap{
	display: flex;
	flex-wrap: wrap;
}
.card{
	width: calc(25% - 15px);
	background: white;
	border-radius: 12px;
	overflow: hidden;
	text-transform: 0.3s
}
.card:hover{
	transform: translateY(-5px)
}
.card img{
	width: 100%;
	height: 200px;
	object-fit: cover;
	display: block;
}
.card-body{
	padding: 15px;
}
.card-title{
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.card-text{
	color: #666;
	font-size: 14px;
}

.pagination{
	display: flex;
	gap: 10px;
	align-items: center;
	margin-top: 20px;
	justify-content: center;
}
.pagination a{
	width:40px;
	height: 40px;
	border-radius: 50%;
	border: 1px solid #ccc;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none; 
	color: #333;
	transition:0.2s;
}
.pagination a:hover{
	background: #f0f0f0;
}
.pagination .arrow{
	font-size: 18px;
}
.pagination a:active{
	background:#CCCCFF;
	color:White;
	border-color:#333;
}
.page-card{
	width: 100%;
}
.detail{
	text-decoration: none;
	color: black;
}
.detail:hover{
	text-decoration: underline;
	color: green;
}
</style>
</head>
<body>
	<div class="card-wrap">
	<%
	for(GoodsVO vo:list){ 
	%>
		<div class="card">
			<img src="<%=vo.getGoods_poster()%>">
			<div class="card-body">
				<div class="card-title"><a href="detail.jsp?no=<%=vo.getNo() %>"><%=vo.getGoods_name() %></div>
				<div class="card-text"><%=vo.getGoods_price() %></div>
			</div>
		</div>
		</a>
		<%} %>
	</div>
	<div class="page-card">
   <div class="pagination">
    <%
      if(startPage>1){
    %>
    <a href="request.jsp?page=<%=startPage-1 %>" class="arrow">&laquo;</a>
    <%
      }
    %>
    <%
      for(int i=startPage;i<=endPage;i++){
    %>
    <a href="request.jsp?page=<%=i %>" <%=curpage==i?"class=active":"" %>><%=i %></a>
    <%
      }
    %>
    <%
      if(endPage<totalpage)
      {
    %>
    <a href="request.jsp?page=<%=endPage+1 %>" class="arrow">&raquo;</a>
    <%
      }
    %>
  </div>
  </div>
</body>
</html>