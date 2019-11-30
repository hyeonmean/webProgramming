<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	%>
</body>
</html>