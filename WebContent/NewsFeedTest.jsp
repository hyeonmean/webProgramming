<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	g_user.setId("admin12");
	UserDBController dbc=new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	//g_user=dbc.searchAboutUser(g_user.getId());
	
	ArrayList<Integer> feedList=new ArrayList<Integer>();
	feedList=dbc.getNewsFeed();
	
	ArrayList<PostPage> pageList=new ArrayList<PostPage>();
	PostPage post=new PostPage();
	
	ArrayList<Integer> postIdx = new ArrayList<Integer>();
	ArrayList<String> userId = new ArrayList<String>();
	ArrayList<String> comment = new ArrayList<String>();
	ArrayList<String> picture = new ArrayList<String>();
	ArrayList<Integer> link = new ArrayList<Integer>();
	Picture pic= new Picture();
	
	for(Integer i: feedList){
		post=dbc.searchPostPageByPostIdx(i);
		
		postIdx.add(post.getPostIdx());
		userId.add(post.getUserId());
		comment.add(post.getComment());
		
		link=post.getPictureList();
		pic=dbc.searchPictureDataByIdx(link.get(0));
		
		picture.add(pic.getPictureAddress());
	}
	request.setAttribute("post",post);
	request.setAttribute("userId",userId);
	request.setAttribute("comment",comment);
	request.setAttribute("picture",picture);
	%>
</body>
</html>