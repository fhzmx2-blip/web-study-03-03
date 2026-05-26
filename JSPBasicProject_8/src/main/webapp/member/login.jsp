<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDAO dao = MemberDAO.newInstance();
MemberVO vo = dao.memberLogin(id, pwd);

if (vo.getMsg().equals("NOID")) {
%>
<script>
	alert("ID가 존재하지 않습니다");
	history.back();
</script>
<%
} else if (vo.getMsg().equals("NOPWD")) {
%>
<script>
	alert("비밀번호가 틀립니다");
	history.back();
</script>
<%
} else {

session.setAttribute("id", vo.getId());
session.setAttribute("name", vo.getName());
session.setAttribute("admin", vo.getIsadmin());
session.setAttribute("post", vo.getPost());
session.setAttribute("address", vo.getAddr1() + " " + vo.getAddr2());
session.setAttribute("phone", vo.getPhone());
response.sendRedirect("../main/main.jsp");
}
%>