<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	g_user.setId("admin12");//�ӽ�
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	String next_page;
	boolean check=false;
	//g_user=dbc.searchAboutUser("admin12");
	
	
	//String user_follow = request.getParameter("follow");
	//String user_following= request.getParameter("following");
	User user=null;
	String user_following="admin";//�ӽ�
	
	check=dbc.follow(user_following);
	
	//db���� �������� �ޱ�
	if(check==true){
		//�ȷ�������
		//next_page="...jsp";
	}
	else{
		//next_page="...jsp";
		//�ȷ��� ����
	}%>

</body>
</html>