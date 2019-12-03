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

	boolean check=false;
	//int idx=(int)request.getAttribute("postIdx");
	String idx=(String)request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	
	PostPage post=new PostPage();
	
	post=dbc.searchPostPageByPostIdx(postIdx);
	
	
	String user_following = post.getUserId();
	check=dbc.unFollow(user_following);
	
	dbc.closeDataBase();
	
	response.sendRedirect("FeedDetail.jsp?postIdx="+postIdx);
	%>

</body>
</html>