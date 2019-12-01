<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">alert("check")</script>
	<%
	request.setCharacterEncoding("utf-8");
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	boolean check=false;
	
	String tag="";
	String savePath="C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\postPictures";
	String savePath2="pictures/postPictures";
	
	int maxSize=1024*1024*10;
	MultipartRequest multi =new MultipartRequest(request,savePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
	String comment=multi.getParameter("comment");
	String file=request.getParameter("imgfile");
	String[] comment_main=comment.split("#");
	int count=comment_main.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	for(int i=1; i<count; i++){
		tag=comment_main[i];
		tagList.add(tag);
	}
	
	int pictureidx;
	
	ArrayList<String> pictureList=new ArrayList<String>();
	
	String uploadname= null;
	
	String filename = "";
        
	filename=multi.getFilesystemName("imgfile");
         
	String fullPath=savePath2+"/"+filename;
	pictureList.add(fullPath);
	
	check=dbc.writePostPage(comment, pictureList, tagList);

	
	//피드 디테일로 가기 위한 포스트 인덱스 얻는 코드
	ArrayList<Integer> feedList=new ArrayList<Integer>();
	feedList=dbc.getNewsFeed();//에러
	
	ArrayList<PostPage> pageList=new ArrayList<PostPage>();
	PostPage post=new PostPage();
	
	ArrayList<Integer> postIdx = new ArrayList<Integer>();
	//int postIdx=dbc.g
	
	//dbc.closeDataBase();
	
	//request.setAttribute("postIdx", o)
	
	//response.sendRedirect("FeedDetail.jsp");
	response.sendRedirect("NewsFeed.jsp");
	%>
	<script type="text/javascript"> </script>
</body>
</html>