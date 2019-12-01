<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<%
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	
	//int postIdx=(int)request.getAttribute("postIndex");
	
	String idx = (String)request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	boolean check=false;
		
	check=dbc.disFavofite(postIdx);
		
	dbc.closeDataBase();
	%>

</body>
</html>