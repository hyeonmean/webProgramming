<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
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
	
	String userId=(String)session.getAttribute("UserID");
	
	ArrayList<String> followerList=new ArrayList<String>();
	ArrayList<String> profileList=new ArrayList<String>();
	
	User user=new User();
	
	for(int i=0; i<followerList.size();i++){
		user=dbc.searchAboutUser(followerList.get(i));
		profileList.add(user.getProfilePictureAddress());
	}
	
	followerList=dbc.searchFollowerUser(userId);
	
	request.setAttribute("followerList", followerList);
	request.setAttribute("profileList", profileList);
	
	dbc.closeDataBase();
	%>

</body>
</html>