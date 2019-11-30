<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
    <link rel="stylesheet" href="./css/WriteBox.css" type="text/css" />
    <link rel="stylesheet" href="./css/setting.css" type="text/css" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="./writeBox.js"></script>
	<script type="text/javascript" src="./setting.js"></script>
    
</head>

<body>


    <script type="text/javascript" src="./writeBox.js"></script>
        <div class="menu">
            <div id="u-mask"></div>
            <a class="logo" href="./NewsFeed.jsp"><img class="onion" src="onion.png"/></a>
            <label class="searchBar" style="text-align: center";onkeypress="if(event.keyCode==13) {실행할 함수명(); return false;}">
                <input type="text"  placeholder="검색"/>
            </label>
            <div class="icon_list">
                <div style="padding-right:15px;"></div>
                <a href="./search_result.jsp">               <!-- 나침반 아이콘, 클릭하면 둘러보기로 넘어감 -->
                    <i class="far fa-compass" ></i>
                </a>

                <div style="padding-right:25px;"></div>
                <a href="#">               <!-- 사용자 마이페이지 아이콘-->
                    <i class="far fa-user"></i>
                    <div class="user-box">
                        <div class="u-content">
                            <button class="u-mypage" onclick="location.href='mypage.jsp'">
                                <i class="fas fa-user-edit"></i>마이페이지
                             </button>
                            <button class="u-bookmark" onclick="location.href='BookMark.jsp'">
                               <i class="fas fa-bookmark"></i> 북마크</button>
         
                            <button class="u-logout" onclick="location.href='LogOutProcess.jsp'">
                                <i class="fas fa-sign-out-alt"></i> 로그아웃</button>
                         </div>
                        <div class="triangle_up3"><a href="#"></a></div>
                    </div>
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
                        <form action="PostProcess.jsp" method="post" enctype="multipart/form-data">
                            <div class="NameBar">
                                <a href="mypage.jsp">
                                    <div id="ProfilePhoto"><img src=${locationOfProfileImg}/></div>
                                    <button id="profile" type="button">${userID}</button>
                                </a>
                   
                               </div>
                               <div class="contentbox">
                                    <div class="imagebox">
                                        <img id="image"/>
                                    </div>
                                    <textarea class="textbox" name="comment" placeholder="내용을 입력하세요 :)"></textarea>
                                </div>
                                <div class="bottom">
                                    <div class="filebox">
                                        <label for="ex_file"><i class="fas fa-camera"></i></label>
                                        <input type="file" id="ex_file" name="imgfile" accept=".jpg,.jpeg,.png,.gif" onchange="LoadImg(this);">
                                        <script>
                                            showImg();
                                        <\/script>
                                    </div>
                                    <label id="btn"><button class="submitbox" type="submit">
                                        <i class="fas fa-paper-plane"></i>
                                    </button></label>
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