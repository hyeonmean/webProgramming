<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="WebModule.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= request.getParameter("postIdx") %>
	<%= request.getParameter("userID") %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String comment = request.getParameter("comment");
		String userId = request.getParameter("userID");
		int postIdx = Integer.valueOf(request.getParameter("postIdx"));
		

		UserDBController dbc=(UserDBController)session.getAttribute("DBController");
		dbc.openDataBase();
		
		dbc.writeComment(postIdx, comment);
		
		request.setAttribute("postIdx", postIdx);
		
		String finalUrl = "FeedDetail.jsp?postIdx="+String.valueOf(postIdx);
		
		
		response.sendRedirect(finalUrl);
	%>

</body>
</html>