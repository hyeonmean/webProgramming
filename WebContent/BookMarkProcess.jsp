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
	g_user.setId("admin12");//�ӽ�
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	String next_page;
	boolean check=false;
	
	//String postIdx = request.getParameter("postIdx");
	int postIdx=10;//�ӽ�
	
	//check=dbc.setBookMark(Integer.parseInt(postIdx));
	check=dbc.setBookMark(postIdx);
	
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