<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<link rel="stylesheet" href="./css/mypage.css" type="text/css" />
	<link rel="stylesheet" href="./css/common.css" type="text/css" />
	<link rel="stylesheet" href="./css/EditProfile.css" type="text/css" />
	<!-- <script type="text/javascript">
        function showImg(){                        
            document.getElementById("ex_file").onchange = function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                // get loaded data and render thumbnail.
				document.getElementById("ProfilePhoto").src = e.target.result;
				document.write("<h1>Loremwafefwefewfwefwefwnefwefwaehfbewaufbergaae</h1>");
            };
            // read the image file as a data URL.
			reader.readAsDataURL(this.files[0]);
			document.write("<h1>Loremwafefwefewfwefwefwnefwefwaehfbewaufbergaae</h1>");
		};
		
    }
	</script> -->
	
	<!-- <script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#ProfilePhoto').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	
		$("#profile_file").change(function() {
			
			readURL(this);
			alert("COMPLETE");
;		});
	</script> -->

	<script type="text/javascript">
        
        var sel_file;
 
        $(document).ready(function() {
            $("#profile_file").on("change", handleImgFileSelect);
        }); `
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_file = f;
 
                var reader = new FileReader();
                reader.onload = function(e) {
					
                    $("#ProfilePhoto").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
 
    </script>

</head>
<body>
	<script type="text/javascript" src="./datePrint.js"></script>
	<jsp:include page="navbar.jsp"/>
	<div style="padding-top: 50px;"></div>
	
	<div class="EditBox">
		 <div class="BoxLayout" >            <!-- ������ ���� -->
			<img id="ProfilePhoto" src="new.jpg">
			<form name="modify" method="POST" action="EditProfileProcess.jsp">
			<label id="file-label" for="profile_file">프로필 사진 편집</label>

			<input type="file" name="img_file" id="profile_file" accept=".jpg,.jpeg,.png,.gif">


			<div class="TextLayout">
				<div class="TextBox">
					<div class="Text">이름</div>
					<div class="Text">연락처</div>
					<div class="Text">생년월일</div>
					<div class="Text">성별</div>
					<div class="Text">소개</div>
				</div>
				<div class="InputBox">

						<label><input class="TextEditBox" type="text" name="name" value="dongjun" /></label><br>
						<div id="PhoneBox">
							<label><input id = "PhoneNum"  type="text" name="phone1" value="010"/>-
								<input id = "PhoneNum"  type="text" name="phone2" value=""/>-
								<input id = "PhoneNum"  type="text" name="phone3" value=""/>
							</label><br>
						</div>

						<div class="BirthDay">
							<script type="text/javascript">
								dateBox();
                			</script>
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