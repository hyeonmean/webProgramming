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
	g_user.setId("admin12");//임시
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	String next_page;
	boolean check=false;
	
	String user_follow = request.getParameter("follow");
	String user_following= request.getParameter("following");
	User user=null;
	String test="admin";//임시
	
	check=dbc.unFollow(test);
	
	//db에서 유저정보 받기
	if(check==true){
		//팔로윙성공
		next_page="...jsp";
	}
	else{
		next_page="...jsp";
		//팔로윙 실패
	}%>

</body>
</html>