<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="WebModule.LoginedDBControllerLayer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDBController dbc=(UserDBController)session.getAttribute("DBController");
		dbc.closeDataBase();
		session.invalidate();
		response.sendRedirect("sign_in.jsp");
	%>

</body>
</html>