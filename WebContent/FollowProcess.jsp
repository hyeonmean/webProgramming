<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	g_user.setId("admin12");//임시
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	String next_page;
	boolean check=false;
	//g_user=dbc.searchAboutUser("admin12");
	
	
	//String user_follow = request.getParameter("follow");
	//String user_following= request.getParameter("following");
	User user=null;
	String user_following="admin";//임시
	
	check=dbc.follow(user_following);
	
	//db에서 유저정보 받기
	if(check==true){
		//팔로윙성공
		//next_page="...jsp";
	}
	else{
		//next_page="...jsp";
		//팔로윙 실패
	}%>

</body>
</html>