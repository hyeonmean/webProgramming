<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	g_user.setId("admin12");
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	boolean check=false;
	String fulltag="";
	String tag="";
	
	
	PostPage post=new PostPage();
	
	int pictureidx;
	ArrayList<String> hashTagList=new ArrayList<String>();
	ArrayList<String> pictureList=new ArrayList<String>();
	
	String comment="가나다라#해시   #태그???";
	String[] comment_main=comment.split("#");
	int count=comment_main.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	for(int i=1; i<count; i++){
		tag=comment_main[i];
		//fulltag=tag.concat(comment_main[i]);
		tagList.add(tag);
	}
	
	String savePath="C:\\Users\\HM\\Documents\\test\\qqqqq.png";
	
	comment=comment_main[0];
	
	pictureList.add(savePath);
	
	//post.findHashTag(fulltag);


	//picturename=postindx_num
	//postindex=??
	
	check=dbc.writePostPage(comment, pictureList, tagList/*post.getHashTagList()*/);
	dbc.closeDataBase();
	
	//response.sendRedirect("NewsFeed.jsp");
	%>
</body>
</html>