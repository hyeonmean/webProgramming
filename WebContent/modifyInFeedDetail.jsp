<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="WebModule.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
    <script type="text/javascript" src="./IconEvent.js"></script>
    <script type="text/javascript" src="./ScrollEvent.js"></script>
    <script type="text/javascript" src="./dynamicSearch.js"></script>
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
    <link rel="stylesheet" href="./css/FeedDetail.css" type="text/css" />
    <link rel="stylesheet" href="./css/search_result.css" type="text/css" />
    <script type="text/javascript" src="./setting.js"></script>
    <style>
        .modifysubmit-button{
            background-color: rgb(248, 248, 248);
            border: 1px solid lightgray;
            font-weight: bold;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div style="padding-top:60px;">
    <div class="back__arrow">
    <button class="back" onclick="history.go(-1);"></button>
    <div onclick="history.go(-1);" style="width:45px; text-align: center; height:45px;"><i class="fas fa-arrow-left"></i></div>
    </div>

    
    <%
        int postIdx = Integer.valueOf(request.getParameter("postIdx"));
        request.setAttribute("postIdx", postIdx);
    %>
    
    <jsp:include page="FeedDetailProcess.jsp"/>
    <%  
        String userId = (String)request.getAttribute("userId");
        String postComment = (String)request.getAttribute("letter");
        String pictureAddress = (String)request.getAttribute("pictureAddress");
        int numberOfFavorite = (int)request.getAttribute("numberOfFavorite");
        String writeUserPicAddress = (String)request.getAttribute("writeUserPicAddress");
    %>

    <%--<script type="text/javascript">
        alert(<%= request.getParameter("postIdx") %>);
    </script>--%>

    <div class="l-out">
    <div class="MainBox">
        <div class="FeedPhoto">
            <img src='<%= pictureAddress %>'>
        </div>

        <div class="contentLayout">
            <div class="NameBar">
                <!-- 댓글올린 유저 그림 -->
                <div id="ProfilePhoto"><img src='<%=writeUserPicAddress%>'></div>
               <button class="profile"><%= userId %></button>
               <button class="follow-status">팔로우</button>
               <div class="setting"><i class="fas fa-ellipsis-h"></i>
                <div class="setting-box">   
                        <div class="content">
                            <button class="modify">
                               <i class="fas fa-pencil-alt"></i> 수정
                            </button>
                            <script type="text/javascript">
                                document.write('<button class="remove" type="button" onclick="location.href=\'DeletePostProcess.jsp?postIdx=<%=request.getParameter("postIdx")%>\'"/>');
                            </script>
                               <i class="far fa-trash-alt"></i> 삭제
                            </div>
                            <div class="triangle_up2"><a href="#"></a></div>
                        </div>
               </div>
            </div>
            <div class="TextLayout">


                        <form name="modify" action="./EditPostprocess.jsp?postIdx=<%=request.getParameter("postIdx") %>" method="POST" >
                            <textarea name="modifyContent"class="TextEdit"><%= postComment %></textarea>
                            <div class="sbmt" style="text-align:center";>
                            <input class="modifysubmit-button" type="submit" value="수정">
                            </div>
                        </form> 

                
            </div>
            <div class="BottomLayout">
                <div class="icon">

                    <i class="far fa-heart" ></i>
                    <i class="far fa-comment-dots"></i>
                    <i class="far fa-share-square"></i>
                    <i class="far fa-bookmark"></i> 
                </div>
                <div class="like">
                    <%=numberOfFavorite%>명이 좋아합니다
                </div>
            </div>
            <%
                UserDBController dbc=(UserDBController)session.getAttribute("DBController");
                String realId = dbc.getUser().getId();
                
            %>
            <form action="InputCommentProcess.jsp?postIdx=<%=postIdx%>&userID=<%=realId%>" method="post">
                <div class="ReplyLayout">
                    <div class="ReplyBox" >
                        <input class="reply" type="text" name="comment" placeholder="댓글 달기"/>
                        <button type="submit">게시</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</body>
</html>