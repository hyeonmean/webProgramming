<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="WebModule.*" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 로그인화면, 폼태그는 작성했으니 이후에 서버에서 데이터 받아온 후 사용자 데이터를 바탕으로 뉴스피드 페이지와 연결해야함 -->
    <link rel="stylesheet" href="./css/sign_in.css" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Josefin+Slab&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="./css/button.css" type="text/css" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<script type="text/javascript" src="./validityCheck.js"></script>
        <div class="frame">
            <h1>onion</h1>
            <form name="login" class="login" method="POST" action="NewsFeed.jsp">
                    <i class="fas fa-user"></i>     <label><input class="text_box" type= "text" name="id" placeholder="아이디"></label><br>
                    <i class="fas fa-key"></i>     <label for "pass"><input class="text_box" name="pswd" type= 'password' placeholder="비밀번호"></label><br>
                    
                    <div><button type="button" onclick="loginValidityCheck();">로그인</button></div>
            </form>
            <div><button onclick="location.href='sign_up.jsp'">회원가입</button></div>
            <div id="forgetPasswordText" >비밀번호를 잊으셨나요?<div style="display:inline-block; color:dodgerblue" onclick="location.replace('./sign_up.html')">비밀번호 찾기</div></div>
        </div>
</body>
</html>