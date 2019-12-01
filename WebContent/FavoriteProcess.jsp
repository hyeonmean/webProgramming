<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	
	//int postIdx=(int)request.getAttribute("postIdx");
	
	String idx = (String) request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	boolean check=false;
	
	check=dbc.setBookMark(postIdx);
	
	dbc.closeDataBase();
	%>
</body>
</html>