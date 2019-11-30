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
	
	<%;
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	String next_page;
	boolean check=false;
	
	//String user_follow = request.getParameter("follow");
	String user_following= request.getParameter("following");
	//User user=null;
	//String test="admin";//임시
	
	check=dbc.unFollow(user_following);
	
	%>

</body>
</html>