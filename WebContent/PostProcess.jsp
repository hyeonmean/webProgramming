<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<script type="text/javascript">alert("check")</script>
	<%
	
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	boolean check=false;
	
	String tag="";
	
	PostPage post=new PostPage();
	
	String comment=request.getParameter("comment");
	String file=request.getParameter("imgfile");
	String[] comment_main=comment.split("#");
	int count=comment_main.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	for(int i=1; i<count; i++){
		tag=comment_main[i];
		//fulltag=tag.concat(comment_main[i]);
		tagList.add(tag);
	}
	
	int pictureidx;
	//ArrayList<String> hashTagList=new ArrayList<String>();
	ArrayList<String> pictureList=new ArrayList<String>();
	
	//String comment=request.getParameter("name");
	
	//post.findHashTag(comment);
	comment=comment_main[0];
	
	String savePath=request.getRealPath("upload");
	
	//pictureList.add(savePath);
	
	String path="C:\\Users\\HM\\Documents\\test\\qqqqq.png";
	pictureList.add(path);
	
	String name="";
	String subject="";
	String filename1 = "";
    String filename2 = "";
	
	int maxSize=1024*1024*10;
	

	


	//picturename=postindx_num
	//postindex=??
	
	check=dbc.writePostPage(comment, pictureList, tagList);
	dbc.closeDataBase();
	
	//response.sendRedirect("NewsFeed.jsp");
	%>
</body>
</html>