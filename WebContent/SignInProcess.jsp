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
	UnLoginedDBController dbc=new UnLoginedDBController("websns-db-server.mysql.database.azure.com", "onion@websns-db-server", "dongjun9120!", "Onion");
	dbc.openDataBase();
	String next_page="NewsFeed.jsp";
	
	User user=null;

	PostPage post=new PostPage();
	String user_id = request.getParameter("id");
	String user_pw= request.getParameter("pswd");
	ArrayList<Integer> link = new ArrayList<Integer>();
	user=dbc.signIn(user_id, user_pw);
	
	//db에서 유저정보 받기
	if(user!=null){
		dbc.closeDataBase();
		UserDBController dbc2= new UserDBController("websns-db-server.mysql.database.azure.com", "onion@websns-db-server", "dongjun9120!", "Onion", user);
		dbc2.openDataBase();
		session.setAttribute("userID",user_id);
		session.setAttribute("DBController", dbc2);

		ArrayList<Integer> feedList=new ArrayList<Integer>();
		feedList=dbc2.getNewsFeed();//에러

		for(Integer i: feedList){
			post=dbc2.searchPostPageByPostIdx(i);
			link=post.getPictureList();
		}
		dbc.closeDataBase();
		dbc2.closeDataBase();
		ArrayList<Integer> postIdx = new ArrayList<Integer>();


		if(link.isEmpty()!=true){
			next_page="NewsFeed.jsp";
			response.sendRedirect(next_page);
		} else{
			next_page="NoFeed.jsp";
			response.sendRedirect(next_page);
		}
	}
	else{
		next_page="sign_in.jsp";
		dbc.closeDataBase();
		response.sendRedirect(next_page);
	}
	%>


</body>
</html>