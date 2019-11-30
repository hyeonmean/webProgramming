<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*" %>
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