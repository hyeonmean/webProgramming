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
    <link rel="stylesheet" href="./css/followbox.css" type="text/css" />
    <link rel="stylesheet" href="./css/mypage.css" type="text/css" />
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
</head>
<body>
	<script type="text/javascript" src="./dynamicFeed.js"></script>

    <jsp:include page="navbar.jsp"/>
    <jsp:include page="mypageProcess.jsp"/>

    <%--팔로우 클릭 이벤트--%>
    <div id="f-mask"></div>
    <div class="f-followevent">
        <script type="text/javascript" src="./IconEvent.js"></script>
            <div class="main_box">
                    <div class="title">
                        <div id="HeadText">
                            팔로우</div><!-- <i class="fas fa-times"></i> --></div>
                        
                    <div class="ContentBox">
                    <div class="l-follower">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">유저이름</div>
                        <div class="follow-status">팔로우</div>
                    </div>
                    <div class="l-follower">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">유저이름</div>
                        <div class="follow-status">팔로우</div>
                    </div>
             
            </div>
            </div>
        </div>
        
    <div id="f2-mask"></div>
    <div class="f2-followevent">
            <div class="main_box">
                    <div class="title">
                        <div id="HeadText">
                            팔로워</div><!-- <i class="fas fa-times"></i> --></div>
                        
                    <div class="ContentBox">
                    <div class="l-follower">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">유저이름</div>
                        <div class="follow-status">팔로우</div>
                    </div>
                    <div class="l-follower">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">유저이름</div>
                        <div class="follow-status">팔로우</div>
                    </div>
             
            </div>
            </div>
        </div>

<%--팔로우 클릭 이벤트 끝--%>

    <%
        String profilePath_temp = (String)request.getAttribute("profilePath");
        String name_temp = (String)request.getAttribute("name");
        String letter_temp = (String)request.getAttribute("letter");
        int postNum_temp = (int)request.getAttribute("postNum");
        int followerNum_temp = (int)request.getAttribute("followerNum");
        int followingNUm_temp = (int)request.getAttribute("followingNUm");
    %>


    <!-- 프로필 구성화면 -->
    <script type="text/javascript">
        var userid_var = '<%=(String)session.getAttribute("userID")%>';
        var profilePath_var = '<%=(String)profilePath_temp%>';
        var name_var = '<%=(String)name_temp%>';
        var letter_var = '<%=letter_temp%>';
        var postNum_var = <%=postNum_temp%>;
        var followerNum_var = <%=followerNum_temp%>;
        var followingNUm_var = <%=followingNUm_temp%>;
        myProfilePrint(userid_var, profilePath_var, name_var, letter_var, postNum_var, followerNum_var, followingNUm_var);
    </script>

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