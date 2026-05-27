<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel" />

<%
model.boardListData(request);
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
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>자유 게시판 (MV구조)</h3>
			<table class="table">
				<tr>
					<td><a href="insert.jsp" class="btn btn-primary btn-sm">새글</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<thead>
					<tr class="danger">
						<th width=10% class="text-center">번호</th>
						<th width=45% class="text-center">제목</th>
						<th width=15% class="text-center">이름</th>
						<th width=20% class="text-center">작성일</th>
						<th width=10% class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td width=10% class="text-center">${vo.no }</td>
							<td width=45%>
							<a href="detail.jsp?no=${vo.no }">${vo.subject }</a>
							<c:if test="${today==vo.dbday }">
									<sup><img src="new.gif"></sup>
								</c:if>
							</td>
							<td width=15% class="text-center">${vo.name }</td>
							<td width=20% class="text-center">${vo.dbday }</td>
							<td width=10% class="text-center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row text-center" style="margin-top: 20px">
			<a href="list.jsp?page=${curpage>1?curpage-1:curpage }"
				class="btn btn-sm btn-danger">이전</a> ${curpage } page / ${totalpage }
			pages <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }"
				class="btn btn-sm btn-danger">다음</a>
		</div>
	</div>
</body>
</html>