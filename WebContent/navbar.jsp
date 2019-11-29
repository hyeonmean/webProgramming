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
</head>

<body>
    <script type="text/javascript" src="./writeBox.js"></script>
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
            <script type="text/javascript">
                var userID ="what", locationOfProfileImg="./new.jpg";
                var writeBoxTemplate = `
                <div class="writeBox">
                    <div class="MainLayout">
                        <form action="PostProcess.jsp" method="post">
                            <div class="NameBar">
                                <a href="mypage.jsp">
                                    <div id="ProfilePhoto"><img src=${locationOfProfileImg}/></div>
                                    <button id="profile">${userID}</button>
                                </a>
                   
                               </div>
                               <div class="contentbox">
                                    <div class="imagebox">
                                        <img id="image"/>
                                    </div>
                                    <textarea class="textbox" placeholder="내용을 입력하세요 :)"></textarea>
                                </div>
                                <div class="bottom">
                                    <div class="filebox">
                                        <label for="ex_file"><i class="fas fa-camera"></i></label>
                                        <input type="file" id="ex_file" accept=".jpg,.jpeg,.png,.gif" onchange="LoadImg(this);">
                                        <script>
                                            showImg();
                                        <\/script>
                                    </div>
                                    <button class="submitbox" type="button">
                                        <label><i class="fas fa-paper-plane"></i></label>
                                    </button>
                                </div>
                        </form>
                    </div>
                </div>
                `;

                document.write(writeBoxTemplate);
            </script>
        </div>  
                </div>
                </div>
</body>
</html>