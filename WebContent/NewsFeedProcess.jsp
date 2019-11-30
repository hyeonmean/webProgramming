<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	User user=dbc.searchAboutUser((String)session.getAttribute("userID"));
	
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