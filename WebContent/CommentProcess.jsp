<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*" %>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("utf-8");
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	String userId=session.getId();
	User user=dbc.searchAboutUser(userId);
	String next_page;
	boolean check=false;
	
	int postIdx=0;
	String postIndex=request.getParameter("postIndex");
	postIdx=(Integer.parseInt(postIndex));
	
	String comment=request.getParameter("comment");
	
	check=dbc.writeComment(postIdx, comment);
	
	
	if(check==true){
		next_page="";
	}
	else{
		next_page="";
	}
	response.sendRedirect(next_page);
	%>

</body>
</html>