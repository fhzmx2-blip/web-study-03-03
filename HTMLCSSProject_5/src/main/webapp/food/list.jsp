<%@page import="java.util.List"%>
<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    FoodDAO dao = new FoodDAO();
    String type = request.getParameter("type");
    if(type == null) type = "한식";

    String strPage = request.getParameter("page");
    if(strPage == null) strPage = "1";
    int curpage = Integer.parseInt(strPage);

    List<FoodVO> list = dao.foodListData(curpage, type);
    int totalpage = dao.foodTotalPage(type);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	
}

.row {
	margin: 0px auto;
	width: 960px;
}

p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<a href="list.jsp?type=한식" class="btn btn-lg btn-danger">한식</a> <a
				href="list.jsp?type=양식" class="btn btn-lg btn-success">양식</a> <a
				href="list.jsp?type=중식" class="btn btn-lg btn-warning">중식</a> <a
				href="list.jsp?type=일식" class="btn btn-lg btn-info">일식</a> <a
				href="list.jsp?type=분식" class="btn btn-lg btn-primary">분식</a>
		</div>
		<div class="row text-center">
		<%for(FoodVO vo:list){ %>
			<div class="col-md-3">
				<div class="thumbnail">
					<a href="detail.jsp?no=<%=vo.getNo()%>"> 
					<img src="<%=vo.getPoster()%>" alt="" style="width: 240px; height: 150px">
						<div class="caption">
							<p><%=vo.getName()%></p>
						</div>
					</a>
				</div>
			</div>
			<%} %>
	</div>
</body>
</html>