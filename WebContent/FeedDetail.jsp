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
    <title>onion</title>

</head>
<body>
	<div id="s-mask"></div>
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
        ArrayList<String> userIdList = new ArrayList<String>();
        
        //댓글 인덱스 리스트
        ArrayList<Integer> cmtIdxList = new ArrayList<Integer>();
        
        //댓글 리스트
        ArrayList<String> cmtList = new ArrayList<String>();
        
        //댓글 단 날짜 리스트
        ArrayList<String> dateList = new ArrayList<String>();
        
        //댓글 단 유저 사진 리스트
        ArrayList<String> commentUserAddress = new ArrayList<String>();
        
        String userId = (String)request.getAttribute("userId");
        String postComment = (String)request.getAttribute("letter");
        String pictureAddress = (String)request.getAttribute("pictureAddress");
        int numberOfFavorite = (int)request.getAttribute("numberOfFavorite");
        String writeUserPicAddress = (String)request.getAttribute("writeUserPicAddress");
        
        Calendar cal = (Calendar)request.getAttribute("dateToStr");
        String dateToStr = cal.get(Calendar.YEAR)+"-"
                + (cal.get(Calendar.MONTH)+1)+"-"
                + cal.get(Calendar.DAY_OF_MONTH)+" "
                + cal.get(Calendar.HOUR)+":"
                + cal.get(Calendar.MINUTE)+":"
                + cal.get(Calendar.SECOND);
        
        boolean empty = (boolean)request.getAttribute("empty");
        
        if(empty != true) {
            userIdList = (ArrayList<String>)request.getAttribute("userIdList");
            cmtIdxList = (ArrayList<Integer>)request.getAttribute("cmtIdxList");
            cmtList = (ArrayList<String>)request.getAttribute("cmtList");
            dateList = (ArrayList<String>)request.getAttribute("dateList");
            commentUserAddress = (ArrayList<String>)request.getAttribute("userPicAddressList");
        
        }
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
<<<<<<< HEAD
               <form action="FollowProcess.jsp?followingId=<%=userId%>&postIdx=<%=postIdx%>" method="get">
               	<button class="follow">팔로우</button>
               </form>
=======
               <button class="follow-status">팔로우</button>
>>>>>>> 1a9de9d594233b152f1c0473084e80a336b54b5d
               <div class="setting"><i class="fas fa-ellipsis-h"></i>
                <div class="setting-box">   
                        <div class="content">
                            <script type="text/javascript">
                                document.write('<button class="modify" type="button" onclick="location.href=\'./modifyInFeedDetail.jsp?postIdx=<%=request.getParameter("postIdx")%>\'"/>');
                            </script>
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
                        
            	<div class="Content" style="padding-top:10px;">
            	<div id="ProfilePhoto"><img src='<%=writeUserPicAddress%>'></div>
            	<div class="TextBox">
                        <button class="profile"><%= userId %></button>
                        <div class="Text"><%= postComment %></div>
                    </div>
            </div>
            <% for(int i = 0; i<userIdList.size(); i++) { %>
                <div class="Content">
                    <div id="ProfilePhoto"><img src='<%=commentUserAddress.get(i) %>'></div>
                    <div class="TextBox">
                        <button class="profile"><%= userIdList.get(i) %></button>
                        <div class="Text"><%= cmtList.get(i) %>
                        </div>
                        <div class="Date"><%=dateList.get(i)%></div>
                    </div>
                   
                </div>
                <% } %>
                
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
                <div class="Date"><%= dateToStr %></div>
            </div>
            <%
            	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
            	String realId = dbc.getUser().getId();
            	
            %>
            <script type="text/javascript">
                if('<%=userId%>' == '<%=realId%>' || '<%=realId%>' =='admin1234'){
                    $('.setting').css("display","block");
                    $('.follow-status').css("display","none");
                }
            </script>
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
    <div style="padding-top:60px;"></div>
    <div style="text-align: center; font-size:1.6rem; font-weight: bold;">이런 스타일은 어떠세요?</div>

    
    <div class="SameLayout" style="margin-top: 25px; margin-left:35px; margin-right:35px;">

        <div class="columns"><figure><img src="./sample/ootd/rename0.jpg"/></figure>
    <figure><img src="./sample/ootd/rename1.jpg"/></figure>
    <figure><img src="./sample/ootd/rename2.jpg"/></figure>
    <figure><img src="./sample/ootd/rename3.jpg"/></figure>
    <figure><img src="./sample/ootd/rename4.jpg"/></figure>
    <figure><img src="./sample/ootd/rename5.jpg"/></figure>
    <figure><img src="./sample/ootd/rename6.jpg"/></figure>
    <figure><img src="./sample/ootd/rename7.jpg"/></figure>
    <figure><img src="./sample/ootd/rename8.jpg"/></figure>
    <figure><img src="./sample/ootd/rename9.jpg"/></figure>
    <figure><img src="./sample/ootd/rename10.jpg"/></figure>
    <figure><img src="./sample/ootd/rename11.jpg"/></figure>
    <figure><img src="./sample/ootd/rename12.jpg"/></figure>
    <figure><img src="./sample/ootd/rename13.jpg"/></figure>
    <figure><img src="./sample/ootd/rename14.jpg"/></figure>
    <figure><img src="./sample/ootd/rename15.jpg"/></figure>
    <figure><img src="./sample/ootd/rename16.jpg"/></figure>
    <figure><img src="./sample/ootd/rename17.jpg"/></figure>
    <figure><img src="./sample/ootd/rename18.jpg"/></figure>
    <figure><img src="./sample/ootd/rename19.jpg"/></figure>
    <figure><img src="./sample/ootd/rename20.jpg"/></figure>
    </div>
    
    
    
    </div>
</body>
</html>