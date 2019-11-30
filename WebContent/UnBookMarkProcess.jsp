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
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	String next_page;
	boolean check=false;
	
	String postIdx = request.getParameter("postIdx");
	
	check=dbc.unSetBookMark(Integer.parseInt(postIdx));
	
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