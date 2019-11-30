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
	String next_page;
	boolean check=false;
	
	int postIdx=1;
	String postIndex=request.getParameter("postIndex");
	postIdx=(Integer.parseInt(postIndex));
	String userId=g_user.getId();
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