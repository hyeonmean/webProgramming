<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="stylesheet" href="./css/mypage.css" type="text/css" />
	<link rel="stylesheet" href="./css/common.css" type="text/css" />
	<link rel="stylesheet" href="./css/EditProfile.css" type="text/css" />

</head>
<body>
	<jsp:include page="navbar.jsp"/>
	<div style="padding-top: 50px;"></div>
	
	<div class="EditBox">
		 <div class="BoxLayout" >            <!-- ������ ���� -->
			<img id="ProfilePhoto" src="profile.JPG">
			<a href="사진업로드.jsp">
				<div id="EditPhoto">프로필사진 변경</div></a>
			<div class="TextLayout">
				<div class="TextBox">
					<div class="Text">이름</div>
					<div class="Text">연락처</div>
					<div class="Text">생년월일</div>
					<div class="Text">성별</div>
					<div class="Text">소개</div>
				</div>
				<div class="InputBox">
					<form name="modify" method="POST" action="서버URL">
						<label><input class="TextEditBox" type="text" name="name" value="dongjun" /></label><br>
						<div id="PhoneBox">
							<label><input id = "PhoneNum"  type="text" name="phone1" value="010"/>-
								<input id = "PhoneNum"  type="text" name="phone2" value="9120"/>-
								<input id = "PhoneNum"  type="text" name="phone3" value="7304"/>
							</label><br>
						</div>

						<div class="BirthDay">
							<select name="user_birth_year">
								<option value="2000" >2000</option>
								<option value="1999" >1999</option>
								<option value="1998" >1998</option>
								<option value="1997" >1997</option>
								<option value="1996" >1996</option>
								<option value="1995" >1995</option>
								<option value="1994" >1994</option>
								<option value="1993" >1993</option>
								<option value="1992" selected>1992</option>
								<option value="1991" >1991</option>
								<option value="1990" >1990</option>
								<option value="1989" >1989</option>
								<option value="1988" >1988</option>
								<option value="1987" >1987</option>
								<option value="1986" >1986</option>
								<option value="1985" >1985</option>
								<option value="1984" >1984</option>
								<option value="1983" >1983</option>
								<option value="1982" >1982</option>
								<option value="1981" >1981</option>
								<option value="1980" >1980</option>
							</select>년
							<select name="user_birth_month">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12" selected>12</option>
								</select>월
								<select name="user_birth_day">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9" selected>9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									일
						</div>
						<div class="gender">
							<label><input  type="radio" name="gender" value="man" />남성
								<input  type="radio" name="gender" value="woman" />여성
								 <input  type="radio" name="gender" value="nochoice"/>선택하지 않음</label><br>
						</div>
						<label><textarea type="text" name="letter" value="한국산업기술대학교 재학중" ></textarea></label><br>
						<input id="sbmt" type="submit"  value="프로필 수정"/>
					</form>
				</div>

			</div>
			</div>
		 </div>
	
	
	</div>
	
	
	
	
	
	
	
</body>
</html>