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
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">alert("check")</script>
	<%
	request.setCharacterEncoding("utf-8");
	g_user.setId("admin12");
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	boolean check=false;
	
	String tag="";
	
	//PostPage post=new PostPage();
	
	String comment=request.getParameter("comment");
	//String file=request.getParameter("imgfile");
	//String[] comment_main=comment.split("#");
	//int count=comment_main.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	/*for(int i=1; i<count; i++){
		tag=comment_main[i];
		//fulltag=tag.concat(comment_main[i]);
		tagList.add(tag);
	}*/
	
	int pictureidx;
	//ArrayList<String> hashTagList=new ArrayList<String>();
	ArrayList<String> pictureList=new ArrayList<String>();
	
	//String comment=request.getParameter("name");
	
	//post.findHashTag(comment);
	//comment=comment_main[0];
	String uploadname= null;
	
	//String savePath="C:\\Users\\HM\\Documents\\test\\";
	
	//String path="C:\\Users\\HM\\Documents\\test\\qqqqq.png";
	//pictureList.add(path);
	
	//String savePath="C:\\Users\\HM\\Documents\\test\\qqqqq.png";
	String savePath=request.getServletContext().getRealPath("folder");
	
	//String name="";
	//String subject="";
	String filename = "";
    //String filename2 = "";
	
	int maxSize=1024*1024*10;
	

        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        MultipartRequest multi =new MultipartRequest(request,savePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
        filename=multi.getFilesystemName("imgfile");
         
        //name=multi.getParameter("name");
        //subject=multi.getParameter("subject");
    		
        //Enumeration files = multi.getFileNames();
        //String file1 = (String)files.nextElement();
        //filename = multi.getFilesystemName(file1);
        //uploadname=multi.getFilesystemName("file")+"<br>";
        //String file2 = (String)files.nextElement();
        //filename2=multi.getFilesystemName(file2);  
	
	//savePath="C:\\Users\\HM\\Documents\\test\\"+filename;
	String fullPath=savePath+"\\"+filename;
	pictureList.add(fullPath);


	//picturename=postindx_num
	//postindex=??
	
	check=dbc.writePostPage(comment, pictureList, tagList);
	dbc.closeDataBase();
	
	//response.sendRedirect("NewsFeed.jsp");
	%>
</body>
</html>