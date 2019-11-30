<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
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
		String keyword=request.getParameter("searchKeyword");

		ArrayList<Integer> postIdxList=new ArrayList<Integer>();
		ArrayList<String> pictureList=new ArrayList<String>();
		Picture pic;

		postIdxList=dbc.getPostPageIdxByHashTag(keyword);

		for(Integer i : postIdxList){
				pic=dbc.searchPictureDataByIdx(postIdxList.get(i));
				pictureList.add(pic.getPictureAddress());
			}
		//postPage=dbc.searchPostPageByPostIdx(postIdx);
		dbc.closeDataBase();

		request.setAttribute("keyword", keyword);
		request.setAttribute("postList", postIdxList);
		request.setAttribute("pictureList", pictureList);
	%>
</body>
</html>