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
	
	ArrayList<Integer> bookMarkList =new ArrayList<Integer>();
	ArrayList<String> postPicturePathList=new ArrayList<String>();
	ArrayList<Integer> postPictureList=new ArrayList<Integer>();
	PostPage post=new PostPage();
	Picture pic = new Picture();
	boolean empty=true;
	
	String user_id=(String)session.getAttribute("userID");
	
	bookMarkList=dbc.searchPostIdxByBookMark("user_id");
	
	for(Integer i: bookMarkList){
		post=dbc.searchPostPageByPostIdx(i);	//해당 인덱스의 포스트페이지 정보 저장
		postPictureList=post.getPictureList();	//해당 포스트페이지의 사진인덱스 저장
		pic=dbc.searchPictureDataByIdx(postPictureList.get(0));	//해당 사진인덱스의 정보들을 저장
		postPicturePathList.add(pic.getPictureAddress());	//해당 사진인덱스의 경로 저장
	}
	
	if(postPicturePathList.size()==1)
		empty=false;
	else
		empty=true;
	
	request.setAttribute("empty", empty);
	request.setAttribute("postPictureList", postPicturePathList);
	
	dbc.closeDataBase();
	%>

</body>
</html>