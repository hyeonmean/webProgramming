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
	
	String userId=(String)session.getAttribute("userID");
	
	ArrayList<String> followingList=new ArrayList<String>();
	ArrayList<String> profileList=new ArrayList<String>();
	
	User user=new User();
	
	for(int i=0; i<followingList.size()-1;i++){
		user=dbc.searchAboutUser(followingList.get(i));
		profileList.add(user.getProfilePictureAddress());
	}
	
	followingList=dbc.searchFollowerUser(userId);
	
	out.println(followingList);

	request.setAttribute("followingList", followingList);
	request.setAttribute("followingProfileList", profileList);
	
	dbc.closeDataBase();
	%>

</body>
</html>