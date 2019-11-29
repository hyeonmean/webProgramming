<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="javascript">
fuction popup(){
	var f=document.fm;
	var pop=window.open;
	pop("","popup","toolbar='no'");
}</script>
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
		g_followList.setFollowerList(dbc2.searchFollowerUser(g_user.getId()));
		g_followList.setFollowID(dbc2.searchFollowingUser(g_user.getId()));
		session.setAttribute("userID",user_id);
		next_page="NewsFeed.jsp";
		session.setAttribute("userID", user_id);
	}
	else{
		next_page="sign_up.jsp";
		//로그인 실패
	}
	//dbc.closeDataBase();
	
	
	response.sendRedirect(next_page);
	%>
	

</body>
</html>