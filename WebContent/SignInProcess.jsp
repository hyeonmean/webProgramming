<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	
	<%;
	UnLoginedDBController dbc=new UnLoginedDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02");
	dbc.openDataBase();
	String next_page="NewsFeed.jsp";
	
	User user=null;
	
	String user_id = request.getParameter("id");
	String user_pw= request.getParameter("pswd");
	
	g_user=dbc.signIn(user_id, user_pw);
	
	//db에서 유저정보 받기
	if(g_user!=null){
		//session.setAttribute("userID", g_user.getId());
		dbc.closeDataBase();
		UserDBController dbc2= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
		dbc2.openDataBase();
		/*session.setAttribute("manage", g_user.getIsManager());
		session.setAttribute("name",g_user.getName());
		session.setAttribute("phone",g_user.getPhoneNumber());*/
		//g_followList.setUserId(g_user.getId());
		//g_followList.setFollowerList(dbc2.searchFollowerUser(g_user.getId()));
		//g_followList.setFollowID(dbc2.searchFollowingUser(g_user.getId()));
		session.setAttribute("userID",user_id);
		session.setAttribute("DBController", dbc2);
		dbc.closeDataBase();
		next_page="NewsFeed.jsp";
		response.sendRedirect(next_page);
	}
	else{
		next_page="sign_in.jsp";
		dbc.closeDataBase();
		response.sendRedirect(next_page);
	}
	//dbc.closeDataBase();
	%>
	<script type="text/javascript">alert("로그인실패")</script>


</body>
</html>