<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
    <script type="text/javascript" src="./ScrollEvent.js"></script>
    <script type="text/javascript" src="./showfollowbox.js"></script>
    <link rel="stylesheet" href="./css/mypage.css" type="text/css" />
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
    <script type="text/javascript" src="./setting.js"></script>
    <link rel="stylesheet" href="./css/followbox.css" type="text/css" />
    
</head>
<body>
	<script type="text/javascript" src="./dynamicFeed.js"></script>
    <jsp:include page="navbar.jsp"/>
	
	<div style="margin-bottom:100px; border-bottom:1px solid lightgray;"></div>
	<div class="line"></div>


    <!-- 이용자가 올린 피드 사진목록 -->
    <div class="photo_list">
        <div class="columns">
		    <script type="text/javascript">
		    	myfeedPrint();
		    </script>
        </div>
    </div>
</body>
</html>