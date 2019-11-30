<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <!-- 사용자 뉴스피드화면, 서버로부터 동적으로 데이터 받아와야함. 한번에 10개쯤? 받아오는게 좋을 듯 하다 -->
        <meta charset="utf-8"/>            
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
        <link rel="stylesheet" href="./css/mypage.css" type="text/css" />
        <link rel="stylesheet" href="./css/common.css" type="text/css" />
        <link rel="stylesheet" href="./css/newsfeed.css" type="text/css" />
        <script type="text/javascript" src="./IconEvent.js"></script>
        <script type="text/javascript" src="./ScrollEvent.js"></script>

    </head>
    <body>
    	<script type="text/javascript" src="./dynamicFeed.js"></script>
    	<jsp:include page="navbar.jsp"/>
        <div style="padding-top: 110px;"></div>
		<!-- 예제로 3개만 출력해봄 -->
		<script type="text/javascript">
			newsfeedPrint();
		</script>
		



    </body>
</html>

