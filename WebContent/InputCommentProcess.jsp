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

	<%
		request.setCharacterEncoding("utf-8");
		
		String comment = request.getParameter("comment");
		
		Cookie[] cookies = request.getCookies();
		
		int postIdx = Integer.valueOf(cookies[1].getValue());
		String userId = cookies[2].getValue();
		
		cookies[1].setMaxAge(0);
		cookies[2].setMaxAge(0);
		cookies[0].setMaxAge(0);
		
		//쿼리문 추가
		UserDBController dbc=(UserDBController)session.getAttribute("DBController");
		dbc.openDataBase();
		
		dbc.writeComment(postIdx, comment);
		
		request.setAttribute("postIdx", postIdx);
		
		String finalUrl = "FeedDetail.jsp?postIdx="+String.valueOf(postIdx);
		
		response.sendRedirect(finalUrl);
	%>

</body>
</html>