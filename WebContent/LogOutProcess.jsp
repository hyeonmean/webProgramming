<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="WebModule.LoginedDBControllerLayer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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