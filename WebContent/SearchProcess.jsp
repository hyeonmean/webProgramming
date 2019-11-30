<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ include file="global.jsp"%>

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
	PostPage postPage=new PostPage();
	String postIdx=request.getParameter("postIdx");
	int idx=Integer.parseInt(postIdx);
		
	//postPage=dbc.searchPostPageByPostIdx(postIdx);
	dbc.closeDataBase();
	%>
</body>
</html>