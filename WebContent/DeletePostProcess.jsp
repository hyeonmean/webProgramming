<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>
<%@ page import="java.sql.*" %>
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
	
	String idx=request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	boolean check=false;
	
	check=dbc.deletePostPage(postIdx);
	
	dbc.closeDataBase();
	
	response.sendRedirect("NewsFeed.jsp");
	
	%>
</body>
</html>