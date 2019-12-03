<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*" %>
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
		String keyword;

		ArrayList<String> allHashTags = new ArrayList<String>();
		Random random = new Random();

		ArrayList<Integer> postIdxList=new ArrayList<Integer>();
		ArrayList<String> pictureList=new ArrayList<String>();
		ArrayList<Integer> link=new ArrayList<Integer>();
		int picIdx;
		
		Picture pic=new Picture();
		PostPage post=new PostPage();

		//여기에 모든 해시태그 받는 함수 작동
		allHashTags = dbc.searchHashTagWithoutOverlap();

		keyword = allHashTags.get(random.nextInt(allHashTags.size()));

		postIdxList=dbc.getPostPageIdxByHashTag(keyword);

		for(/*int i=0; i<postIdxList.size();i++*/Integer i:postIdxList){
			post=dbc.searchPostPageByPostIdx(i);
			link=post.getPictureList();
			pic=dbc.searchPictureDataByIdx(link.get(0));
			pictureList.add(pic.getPictureAddress());
			}
		//postPage=dbc.searchPostPageByPostIdx(postIdx);
		dbc.closeDataBase();

		request.setAttribute("keyword", keyword);
		request.setAttribute("postList", postIdxList);
		request.setAttribute("pictureList", pictureList);
	%>

	<jsp:forward page="search_result.jsp"/>
</body>
</html>