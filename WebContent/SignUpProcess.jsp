<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="WebModule.*" %>   
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("utf-8");
		UnLoginedDBController dbc=new UnLoginedDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02");
		dbc.openDataBase();	
	//전해받은 유저 정보
		String user_id = request.getParameter("id");
		String user_pw= request.getParameter("pswd");
		String user_name=request.getParameter("username");
		
		String num1=request.getParameter("phone1");
		String num2=request.getParameter("phone2");
		String num3=request.getParameter("phone3");
		String user_phone=num1+num2+num3;
		
		String user_age=/*request.getParameter("age")*/"20";
		String user_gender=request.getParameter("gender");
		String user_letter=null;
		//기본프로필 경로
		String user_pictureAddress=null;
		String user_date=request.getParameter("date");
		
		boolean user_manage=false;
		boolean lock=false;
		
		user_pictureAddress="C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\"+user_id+".gif";
		Gender u_gender;
		
		String savePath="C:\\\\Users\\\\HM\\\\Documents\\\\GitHub\\\\webProgramming\\\\WebContent\\\\pictures\\\\profilePictures\\\\"+user_id+".gif";
		
		FileInputStream fis=null;
		FileOutputStream fos=null;
		int readcount=0;
		byte[] buffer=new byte[1024];
		
		if(user_gender.equals("male")){
			u_gender=Gender.Male;
			fis=new FileInputStream("C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\defualt\\male.gif");
			fos=new FileOutputStream(user_pictureAddress);
			//user_pictureAddress="C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\male.gif";
		}
		else if(user_gender.equals("female")){
			u_gender=Gender.Female;
			fis=new FileInputStream("C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\defualt\\female.gif");
			fos=new FileOutputStream(user_pictureAddress);
			//user_pictureAddress="C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\female.gif";
		}
		else{
			u_gender=Gender.Unknown;
			fis=new FileInputStream("C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\defualt\\unknown.gif");
			fos=new FileOutputStream(user_pictureAddress);
			//user_pictureAddress="C:\\Users\\HM\\Documents\\GitHub\\webProgramming\\WebContent\\pictures\\profilePictures\\unknown.gif";
		}
		while((readcount=fis.read(buffer))!=-1){
			fos.write(buffer,0,readcount);
		}
		fis.close();
		fos.close();
		
		
		
		String next_page=null;
		boolean check=false;
		User user=new User.Builder(user_id, user_pw, user_name, user_phone, false, true).age(Integer.parseInt(user_age)).gender(u_gender).letter(user_letter).profilePictureAddress(savePath).build();
		
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