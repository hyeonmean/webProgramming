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
	
	<%;
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	String next_page;
	boolean check=false;
	
	String user_follow = request.getParameter("follow");
	String user_following= request.getParameter("following");
	User user=null;
	
	check=dbc.follow(user_following);
	
	//db���� �������� �ޱ�
	if(check==true){
		//�ȷ�������
		next_page="...jsp";
	}
	else{
		next_page="...jsp";
		//�ȷ��� ����
	}%>

</body>
</html>