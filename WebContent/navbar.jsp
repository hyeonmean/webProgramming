<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta charset="utf-8"/>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="./css/common.css" type="text/css" />
        <link rel="stylesheet" href="./css/WriteBox.css" type="text/css" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript" src="./writeBox.js"></script>
        <script type="text/javascript">
            function wrapWindowByMask(){
 
                //화면의 높이와 너비를 구한다.
                var maskHeight = $(document).height();  
                var maskWidth = $(window).width();  

                //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
                $("#mask").css({"width":maskWidth,"height":maskHeight});  

                //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

                $("#mask").fadeIn(0);      
                $("#mask").fadeTo("slow",0.6);    

                //윈도우 같은 거 띄운다.
                $(".window").show();

            }
        </script>
        <script type="text/javascript">
                $(document).ready(function(){
                 //검은 막 띄우기
                 $(".openMask").click(function(e){
                     e.preventDefault();
                     wrapWindowByMask();
                 });
         
                 //닫기 버튼을 눌렀을 때
                 $(".window .close").click(function (e) {  
                     //링크 기본동작은 작동하지 않도록 한다.
                     e.preventDefault();  
                     $("#mask, .window").hide();  
                 });       
         
                 //검은 막을 눌렀을 때
                 $("#mask").click(function () {  
                     $(this).hide();  
                     $(".window").hide();  
                
                 });      
         
                });
        </script>
        <script type="text/javascript">
            function showImg(){                        
             document.getElementById("ex_file").onchange = function () {
             var reader = new FileReader();
                 reader.onload = function (e) {
                     // get loaded data and render thumbnail.
                     document.getElementById("image").src = e.target.result;
                 };
                 // read the image file as a data URL.
                 reader.readAsDataURL(this.files[0]);
                };
                }
                </script>







</head>
<body>
        <div class="menu">
            <a class="logo" href="./NewsFeed.jsp"><i class="fas fa-circle-notch"></i></a>
            <label class="searchBar" style="text-align: center;">
                <input type="text"  placeholder="검색"/>
            </label>
            <div class="icon_list">
            	<div style="padding-right:15px;"></div>
                <a href="./search_result.jsp">               <!-- 나침반 아이콘, 클릭하면 둘러보기로 넘어감 -->
                    <i class="far fa-compass" ></i>
                </a>
                <div style="padding-right:25px;"></div>
                <a href="./search_result.jsp">                <!-- 알림 아이콘, 사용자와 관련된 활동내역 보여줌, 이건 아직 디자인 만드는중 -->
                    <i class="far fa-bell"></i>
                </a>  
                <div style="padding-right:25px;"></div>
                <a href="./mypage.jsp">               <!-- 사용자 마이페이지 아이콘-->
                    <i class="far fa-user"></i>
                
                </a>
                <div style="padding-right:29px;"></div>
                <a href="#" class="openMask">
                    <i class="far fa-edit"></i>
                </a>
                
            </div>
        </div>
        <div id ="wrap"> 
            <div id = "container">  
                <div id="mask"></div>
        <div class="window">
			<%-- <jsp:include page="WriteBox.jsp"> --%>
        </div>  
                </div>
                </div>
</body>
</html>