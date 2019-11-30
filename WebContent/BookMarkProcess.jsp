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
	
	String idx = request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);//임시
	
	//check=dbc.setBookMark(Integer.parseInt(postIdx));
	check=dbc.setBookMark(postIdx);
	
	dbc.closeDataBase();
	%>

</body>
</html>