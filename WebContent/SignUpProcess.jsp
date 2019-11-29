<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="WebModule.*" %>   
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		UnLoginedDBController dbc=new UnLoginedDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02");
		dbc.openDataBase();	
	//전해받은 유저 정보
		String user_id = request.getParameter("id");
		String user_pw= request.getParameter("pswd");
		String user_name=/*request.getParameter("name")*/"name";
		
		String num1=request.getParameter("phone1");
		String num2=request.getParameter("phone2");
		String num3=request.getParameter("phone3");
		String user_phone=num1+num2+num3;
		
		String user_age=/*request.getParameter("age")*/"20";
		String user_gender=request.getParameter("gender");
		String user_letter=null;
		String user_pictureAddress=null;
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
		
		
		
		String next_page=null;
		boolean check=false;
		User user=new User.Builder(user_id, user_pw, user_name, user_phone, false, true).age(Integer.parseInt(user_age)).gender(u_gender).letter(user_letter).profilePictureAddress(user_pictureAddress).build();
		
		//유저정보 db에 저장
		check=dbc.signUp(user);
		if(check==true){
			next_page="sign_in.jsp";	
		}
		else{
			next_page="sign_up.jsp";
		}
		dbc.closeDataBase();
		response.sendRedirect(next_page);
	%>
	

</body>
</html>