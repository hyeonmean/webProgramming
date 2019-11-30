<!-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> -->
<!DOCTYPE html>
<html>
<head>
	<!-- 회원가입 페이지 마찬가지로 폼태그는 작성해 놓음 -->
    <link rel="stylesheet" href="./css/sign_in.css" type="text/css" />
    <link rel="stylesheet" href="./css/button.css" type="text/css" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
	<script type="text/javascript" src="./datePrint.js"></script>
    <div id="signUpFrame">
        <h1>Onion</h1>
        <h2>register</h2>
        <form name="login" class="login" method="post" action="./SignUpProcess.jsp">
            <i class="fas fa-user"></i>     <label><input class="text_box" type= "text"  name="id" placeholder="아이디" ></label><br>
            <i class="fas fa-key"></i>     <label for "pass"><input class="text_box" name="pswd" type= 'password'  placeholder="비밀번호"></label><br>
            <i class="fas fa-key"></i>     <label for "pass"><input class="text_box" name="checkpswd" type= 'password' placeholder="비밀번호확인"></label><br>
            <i class="fas fa-user"></i>     <label><input class="text_box" type= "text"  name="username" placeholder="이름" ></label><br>
            <i class="fas fa-phone"></i>     						
            <div id="PhoneBox">
                <input id = "PhoneNum"  type="text" name="phone1" value="010"/>-
                <input id = "PhoneNum"  type="text" name="phone2" value=""/>
                <input id = "PhoneNum"  type="text" name="phone3" value=""/>
                    
            </div>
            <br>
            <i class="fas fa-calendar-alt"></i>    
            <div class="BirthDay">
            	<script type="text/javascript">
					dateBox();
                </script>
            </div><br>
            <i class="fas fa-venus-mars"></i>
            <div class="gender">
                <input  type="radio" name="gender" value="male" />남성
                <input  type="radio" name="gender" value="female" />여성
                <input  type="radio" name="gender" value="nochoice"/>선택하지 않음</label><br>
            </div>
                    
                <!-- <i class="fas fa-map-marker-alt"></i>     <label><input class="text_box" type= "text"  value="�ּ�" onclick="value=''" ></label><br> -->
            <button>회원가입</button>
        </form>
        <div id="forgetPasswordText" >계정이 있으신가요? <div style="display:inline-block; color:dodgerblue" onclick="location.replace('./sign_in.html')">로그인</div></div>
    </div>
    
</body>
</html>