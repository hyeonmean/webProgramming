<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ include file="global.jsp"%>



<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<%;
	UnLoginedDBController dbc=new UnLoginedDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02");
	dbc.openDataBase();
	String next_page="NewsFeed.jsp";
	
	User user=null;
	
	String user_id = request.getParameter("id");
	String user_pw= request.getParameter("pswd");
	
	user=dbc.signIn(user_id, user_pw);
	
	//db에서 유저정보 받기
	if(user!=null){
		dbc.closeDataBase();
		UserDBController dbc2= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", user);
		dbc2.openDataBase();
		session.setAttribute("userID",user_id);
		session.setAttribute("DBController", dbc2);
		dbc.closeDataBase();
		dbc2.closeDataBase();
		next_page="NewsFeed.jsp";
		response.sendRedirect(next_page);
	}
	else{
		next_page="sign_in.jsp";
		dbc.closeDataBase();
		response.sendRedirect(next_page);
	}
	%>


</body>
</html>