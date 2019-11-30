<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id=(String)session.getAttribute("userID");
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	User user=dbc.searchAboutUser("id");
	boolean check=false;
	
	check=dbc.deletePostPage(21);
	%>

</body>
</html>