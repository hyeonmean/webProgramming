<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
    
    <script type="text/javascript" src="./showfollowbox.js"></script>
    <link rel="stylesheet" href="./css/followbox.css" type="text/css" />
    <link rel="stylesheet" href="./css/mypage.css" type="text/css" />
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
    <title>onion</title>
</head>
<body>
    <script type="text/javascript" src="./dynamicFollowering.js"></script>
	<script type="text/javascript" src="./dynamicFeed.js"></script>
    <jsp:include page="navbar.jsp"/>
    <jsp:include page="MyPageFollower.jsp"/>
    <jsp:include page="MyPageFollowing.jsp"/>

    <%
        boolean emptying = (boolean)request.getAttribute("emptying");
        boolean emptyer = (boolean)request.getAttribute("emptyer");
        ArrayList<String> follower_temp = new ArrayList<String>();
        ArrayList<String> followerProfileList_temp = new ArrayList<String>();
        ArrayList<String> following_temp = new ArrayList<String>();
        ArrayList<String> followingProfileList_temp = new ArrayList<String>();
        if (emptyer == true){
            follower_temp = (ArrayList<String>)request.getAttribute("followerList");
            followerProfileList_temp = (ArrayList<String>)request.getAttribute("followerProfileList");
        }
        if (emptying == true){
            following_temp = (ArrayList<String>)request.getAttribute("followingList");
            followingProfileList_temp = (ArrayList<String>)request.getAttribute("followingProfileList");
        }
    %>



    <jsp:include page="mypageProcess.jsp"/>
    <%
        String profilePath_temp = (String)request.getAttribute("profilePath");
        String name_temp = (String)request.getAttribute("name");
        String letter_temp = (String)request.getAttribute("letter");
        int postNum_temp = (int)request.getAttribute("postNum");
        int followerNum_temp = (int)request.getAttribute("followerNum");
        int followingNUm_temp = (int)request.getAttribute("followingNUm");
        ArrayList<Integer> posts_temp = new ArrayList<Integer>();
        ArrayList<String> postPictureLocationList_temp = new ArrayList<String>();
        postPictureLocationList_temp = (ArrayList<String>)request.getAttribute("postPictureLocationList");
        posts_temp = (ArrayList<Integer>)request.getAttribute("posts");
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
    <script type="text/javascript">
        var posts_array = new Array();
        var picture_array = new Array();
        <%for(int i=0; i<posts_temp.size(); i++){%>
            posts_array.push(<%=(Integer)posts_temp.get(i)%>);
            picture_array.push('<%=(String)postPictureLocationList_temp.get(i)%>');
        <%}%>
        myfeedPrint(posts_array, picture_array);
    </script>
    </div>
</body>
</html>