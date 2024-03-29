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
	//User user=dbc.searchAboutUser((String)session.getAttribute("userID"));
	
	ArrayList<Integer> feedList=new ArrayList<Integer>();
	feedList=dbc.getNewsFeed();//에러
	
	ArrayList<PostPage> pageList=new ArrayList<PostPage>();
	PostPage post=new PostPage();
	
	ArrayList<Integer> postIdx = new ArrayList<Integer>();
	ArrayList<String> userId = new ArrayList<String>();
	ArrayList<String> comment = new ArrayList<String>();
	ArrayList<String> picture = new ArrayList<String>();
	
	ArrayList<Integer> link = new ArrayList<Integer>();
	
	ArrayList<String> favoriteList=new ArrayList<String>();
	ArrayList<Integer> favoriteNum=new ArrayList<Integer>();
	
	ArrayList<String> userId_profileLocationList = new ArrayList<String>();
	
	Picture pic= new Picture();
	//
	for(Integer i: feedList){
		post=dbc.searchPostPageByPostIdx(i);
		//System.out.println(post.getComment());
		String userID_temp = post.getUserId();
		User writeUser = dbc.searchAboutUser(userID_temp);
		String userProfileLocation_temp = writeUser.getProfilePictureAddress();		
		
		//System.out.println(post.getComment());
		userId_profileLocationList.add(userProfileLocation_temp);
		
		
		favoriteList=post.getFavoriteList();
		favoriteNum.add(favoriteList.size());
		postIdx.add(post.getPostIdx());//에러
		userId.add(post.getUserId());
		comment.add(post.getComment());
		
		link=post.getPictureList();

		pic=dbc.searchPictureDataByIdx(link.get(0));//에러
		picture.add(pic.getPictureAddress());
	}
	
	dbc.closeDataBase();
	if(link.isEmpty()!=true){
		request.setAttribute("empty", true);
		request.setAttribute("post",postIdx);
		request.setAttribute("userId",userId);
		request.setAttribute("comment",comment);
		request.setAttribute("picture",picture);
		request.setAttribute("favoriteNum", favoriteNum);
		request.setAttribute("writerProfileLocation", userId_profileLocationList);
	}else {
		request.setAttribute("empty", false);
	}
	
	dbc.closeDataBase();
	
	//response.sendRedirect("NewsFeed.jsp");
	
	//System.out.println(post.getComment());
	%>
</body>
</html>