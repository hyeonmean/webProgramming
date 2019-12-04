<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
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
        <script type="text/javascript" src="./setting.js"></script>
		<title>onion</title>
    </head>
    <body>
        <script type="text/javascript" src="./dynamicFeed.js"></script>
        <jsp:include page="navbar.jsp"/>
        <div style="padding-top: 110px;"></div>
        <!-- 예제로 3개만 출력해봄 -->
        
        <jsp:include page="NewsFeedProcess.jsp"/>
        <%
            boolean empty = (boolean)request.getAttribute("empty");
            ArrayList<Integer> postIdx_temp = new ArrayList<Integer>();
            ArrayList<String> userId_temp = new ArrayList<String>();
            ArrayList<String> comment_temp = new ArrayList<String>();
            ArrayList<String> picture_temp = new ArrayList<String>();
            ArrayList<Integer> favoriteNum_temp = new ArrayList<Integer>();
            if(empty == true){
                postIdx_temp = (ArrayList<Integer>)request.getAttribute("post");
                userId_temp = (ArrayList<String>)request.getAttribute("userId");
                comment_temp = (ArrayList<String>)request.getAttribute("comment");
                picture_temp = (ArrayList<String>)request.getAttribute("picture");
                favoriteNum_temp = (ArrayList<Integer>)request.getAttribute("favoriteNum");
            }

            //나중에 request로 empty 잘 받았는지 체크하기 자바스크립트에 alert 코드 있으
            /*
            userId_temp.add("testMan");
            comment_temp.add("testComment");
            picture_temp.add("./new.jpg");
            userId_temp.add("testMan2");
            comment_temp.add("testComment2");
            picture_temp.add("./sample/11.JPG");
            */
        %>

      <script type="text/javascript">
            var empty = <%=(boolean)request.getAttribute("empty")%>;
            var post_array = new Array();
            var userId_array = new Array();
            var comment_array = new Array();
            var picture_array = new Array();
            var favoriteNum_array = new Array();
            <%for(int i=0; i<userId_temp.size(); i++){%>
                post_array.push(<%=(Integer)postIdx_temp.get(i)%>);
                userId_array.push('<%=(String)userId_temp.get(i)%>');
                comment_array.push('<%=(String)comment_temp.get(i)%>');
                picture_array.push('<%=(String)picture_temp.get(i)%>');
                favoriteNum_array.push(<%=(Integer)favoriteNum_temp.get(i)%>);
            <%}%>
            console.log(typeof empty);
         newsfeedPrint(empty, post_array, userId_array, comment_array, picture_array, favoriteNum_array);
      </script>
        
	


    </body>
</html>
