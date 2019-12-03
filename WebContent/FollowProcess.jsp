<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
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

	boolean check=false;
	
	PostPage post=new PostPage();
	
	String idx=request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	 
	post= dbc.searchPostPageByPostIdx(postIdx);
	
	String user_following=post.getUserId();
	
	check=dbc.follow(user_following);
	
	dbc.closeDataBase();
	%>

</body>
</html>