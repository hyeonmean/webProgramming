<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*" %>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String next_page;
	boolean check=false;
	
	String user_name=request.getParameter("name");
	
	String num1=request.getParameter("phone1");
	String num2=request.getParameter("phone2");
	String num3=request.getParameter("phone3");
	String user_phone=num1+num2+num3;
	
	String year=request.getParameter("user_birth_year");
	String month=request.getParameter("user_birth_month");
	String day=request.getParameter("user_birth_day");
	String birthday=year+"-"+month+"-"+day;
	
	//String user_age=request.getParameter("age");
	String user_gender=request.getParameter("gender");
	String user_letter=request.getParameter("letter");
	String user_pictureAddress=request.getParameter("EditPhoto");
	String user_date=request.getParameter("date");
	boolean user_manage=false;
	boolean lock=false;
	Gender u_gender;
	
	if(user_gender.equals("male")){
		u_gender=Gender.Male;
	}
	else if(user_gender.equals("female")){
		u_gender=Gender.Female;
	}
	else{
		u_gender=Gender.Unknown;
	}
	
	g_user.setName(user_name);
	g_user.setPhoneNumber(user_phone);
	g_user.setGender(u_gender);
	g_user.setLetter(user_letter);
	g_user.setProfilePictureAddress(user_pictureAddress);
	
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	
	dbc.openDataBase();
	
	check=dbc.editProfile();
	
	dbc.closeDataBase();
	
	
	
	
	%>

</body>
</html>