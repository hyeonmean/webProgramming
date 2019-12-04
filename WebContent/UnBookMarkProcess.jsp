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
	<%
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	
	//int postIdx=(int)request.getAttribute("postIndex");
	
	String idx = (String)request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	boolean check=false;
		
	check=dbc.unSetBookMark(postIdx);
		
	dbc.closeDataBase();
	response.sendRedirect("FeedDetail.jsp?postIdx="+postIdx);
	%>

</body>
</html>