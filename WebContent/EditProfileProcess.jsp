<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*" %>
<%@ include file="global.jsp"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*"%>

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
	String user_id=(String)session.getAttribute("userID");
	User user=dbc.searchAboutUser(user_id);
	
	String next_page;
	boolean check=false;
	
	String profilePath=user.getProfilePictureAddress();
	
	String savePath="/home/DongjunLim/web/onion/pictures/profilePictures";
	String savePath2="./pictures/profilePictures";
	
	int maxSize=1024*1024*10;
	
	MultipartRequest multi =new MultipartRequest(request,savePath,maxSize,"utf-8",new DefaultFileRenamePolicy());	
	
	String filename = "";
    
	filename=multi.getFilesystemName("img_file");
	
	String fullPath=savePath2+"/"+filename;
	
	String user_name=multi.getParameter("name");
	
	String num1=multi.getParameter("phone1");
	String num2=multi.getParameter("phone2");
	String num3=multi.getParameter("phone3");
	String user_phone=num1+num2+num3;
	
	String year=multi.getParameter("user_birth_year");
	String month=multi.getParameter("user_birth_month");
	String day=multi.getParameter("user_birth_day");
	String birthday=year+"-"+month+"-"+day;
	
	//String user_age=request.getParameter("age");
	String user_gender=multi.getParameter("gender");
	String user_letter=multi.getParameter("letter");
	String user_pictureAddress=fullPath;
	String user_date=multi.getParameter("date");
	boolean user_manage=false;
	boolean lock=false;
	Gender u_gender;
	
	if(user_gender.equals("man")){
		u_gender=Gender.Male;
	}
	else if(user_gender.equals("woman")){
		u_gender=Gender.Female;
	}
	else{
		u_gender=Gender.Unknown;
	}
	File f= new File(profilePath);
	if(f.exists())
		f.delete();
	
	user.setName(user_name);
	user.setPhoneNumber(user_phone);
	user.setGender(u_gender);
	user.setLetter(user_letter);
	user.setProfilePictureAddress(fullPath);
	
	dbc.closeDataBase();
	
	session.removeAttribute("DBController");
	
	UserDBController dbc2= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", user);
	dbc2.openDataBase();
	
	session.setAttribute("DBController", dbc2);
	
		
	check=dbc2.editProfile();
	
	dbc2.closeDataBase();
	

	response.sendRedirect("mypage.jsp");
	
	%>

</body>
</html>