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
	
	String postIdx = request.getParameter("postIdx");
	
	check=dbc.unSetBookMark(Integer.parseInt(postIdx));
	
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