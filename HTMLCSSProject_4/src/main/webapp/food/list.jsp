<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>

<%

String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curpage = Integer.parseInt(strPage);
FoodDAO dao = new FoodDAO();
List<FoodVO> list = dao.foodListData(curpage);
int totalpage = dao.foodTotalPage();

final int BLOCK = 10;
int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
if (endPage > totalpage)
	endPage = totalpage;
%>
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
	/* 화면에 출력 */
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
		<!-- 전체 영역 -->
		<div class="row">
			<!-- 출력하는 영역 -->
			<%
			for (FoodVO vo : list) {
			%>
			<div class="col-md-3">
				<!-- 숫자합 12가 되면 자동으로 다음줄로 내려간다 -->
				<div class="thumbnail">
					<a href="detail.jsp?no=<%=vo.getNo()%>"> <img
						src="<%=vo.getPoster()%>" alt=""
						style="width: 240px; height: 150px">
						<div class="caption">
							<p><%=vo.getName()%></p>
						</div>
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="row text-center">
			<ul class="pagination">
				<%
				if (startPage > 1) // 1 11 21 31 ....
				{
				%>
				<li><a href="list.jsp?page=<%=startPage - 1%>">&laquo;</a></li>
				<%
				}
				%>
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<li <%=i == curpage ? "class=active" : ""%>><a
					href="list.jsp?page=<%=i%>"><%=i%></a></li>
				<%
				}
				%>

				<%
				if (endPage < totalpage) {
				%>
				<li><a href="list.jsp?page=<%=endPage + 1%>">&raquo;</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</body>
</html>






