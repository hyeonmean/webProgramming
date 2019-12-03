<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//프로필사진, 게시물슈, 팔로우슈, 팔로워슈, 이름, 레터
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	//User user=dbc.searchAboutUser((String)session.getAttribute("userID"));
	//프로필 사진은 editprofile만든 후에 작성
	String user_id=(String)session.getAttribute("userID");
	User user=dbc.searchAboutUser(user_id);
	Picture pic= new Picture();
	PostPage post=new PostPage();

	String profilePath=null;
	String user_name=null;
	String user_letter=null;
	
	profilePath=user.getProfilePictureAddress();
	ArrayList<String> followingList= new ArrayList<String>();
	ArrayList<String> followerList=new ArrayList<String>();
	ArrayList<Integer> postIdxList=new ArrayList<Integer>();
	ArrayList<String> postPictureLocationList = new ArrayList<String>();
	ArrayList<Integer> link = new ArrayList<Integer>();

	postIdxList=dbc.getPostPageIdxByUserId(user_id);
	
	followingList=dbc.searchFollowingUser(user_id);
	followerList=dbc.searchFollowerUser(user_id);
	
	user_name=user.getName();
	user_letter=user.getLetter();
	
	for(Integer i: postIdxList){
		post=dbc.searchPostPageByPostIdx(i);
		link=post.getPictureList();

		pic=dbc.searchPictureDataByIdx(link.get(0));//에러
		postPictureLocationList.add(pic.getPictureAddress());
	}




	request.setAttribute("profilePath", profilePath); //string
	request.setAttribute("postNum", postIdxList.size());	//integer
	request.setAttribute("posts", postIdxList);
	request.setAttribute("postPictureLocationList", postPictureLocationList);
	request.setAttribute("followerNum",followerList.size());	//integer
	request.setAttribute("followingNUm",followingList.size());	//intefer
	request.setAttribute("name", user_name);	//string
	request.setAttribute("letter", user_letter);	//string
	
	dbc.closeDataBase();
	%>

</body>
</html>