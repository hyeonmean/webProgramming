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
	String next_page;
	boolean check=false;
	
	//String postIdx = request.getParameter("postIdx");
	int postIdx=10;//임시
	
	//check=dbc.setBookMark(Integer.parseInt(postIdx));
	check=dbc.setBookMark(postIdx);
	
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