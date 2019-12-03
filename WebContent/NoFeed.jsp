<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
        <link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
        <script type="text/javascript" src="./ScrollEvent.js"></script>
        <script type="text/javascript" src="./dynamicSearch.js"></script>
        <script type="text/javascript" src="./setting.js"></script>
        <link rel="stylesheet" href="./css/common.css" type="text/css" />
        <link rel="stylesheet" href="./css/FeedDetail.css" type="text/css" />
        <link rel="stylesheet" href="./css/search_result.css" type="text/css" />
        <link rel="stylesheet" href="./css/setting.css" type="text/css" />
        <title>onion</title>
    <style>
        .massage-box{
            
            text-align: center;
            color:gray;
            font-weight: 700;
            font-size:2rem;
            font-family: 'Gothic A1', sans-serif;
            padding-top: 120px;
        }
        .no-follow-massage{
            margin-top:15px;   
        }
        .no-follow-emoticon{
            
            font-size:5rem;
        }
        
        
        
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="massage-box">
        <div class="no-follow-emoticon">
                <i class="far fa-surprise"></i>
            </div>
        <div class="no-follow-massage">
            회원님의 팔로우 피드가 비었습니다!
        
        </div>

    </div>

    <div style="padding-top:150px;"></div>
    <div style="text-align: center; font-size:1.6rem; font-weight: bold;">이런 스타일은 어떠세요?</div>
    <div class="SameLayout" style="margin-top: 25px; margin-left:35px; margin-right:35px;">
    	<script type="text/javascript">
			searchListPrint();
		</script>
    
    
    
    
    </div>



    
</body>
</html>