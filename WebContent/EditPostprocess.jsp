<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="com.oreilly.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
	//request.setCharacterEncoding("utf-8");
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();	
	boolean check=false;
	
	String idx=(String)request.getParameter("postIdx");
	int postIdx=Integer.parseInt(idx);
	//int postIdx=(int)request.getParameter("postIdx");
	String letter =(String)request.getParameter("modifyContent");
	String tag="";
	
	String []full_Letter=letter.split("#");
	int count=full_Letter.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	for(int i=1; i<count; i++){
		tag=full_Letter[i];
		tagList.add(tag);
	}
	
	dbc.editPostPageComment(letter, postIdx);
	dbc.updateHastTagInPostPage(tagList, postIdx);
	
	
	
	/*
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
	*/
	
	dbc.closeDataBase();
	
	String url = "FeedDetail.jsp?postIdx="+postIdx;
	response.sendRedirect(url);
	%>

</body>
</html>