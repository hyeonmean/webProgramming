function loginValidityCheck(){
	var idRegexp = /^[a-zA-Z0-9]{4,16}$/;
	var pwRegexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
		
	var form = document.login;
	
	if (form.id.value == ""){
		alert("아이디를 입력하십시오.");
		form.userID.focus();
		return false;
	}
	
	if (!idRegexp.test(form.id.value)){
		alert("적절하지 못한 ID입니다.");
		form.id.value="";
		form.id.focus();
		return false;
	}
	
	if (form.pswd.value == ""){
		alert("비밀번호를 입력하십시오.");
		form.pswd.focus();
		return false;
	}
	
	if (!pwRegexp.test(form.pswd.value)){
		alert("적절하지 못한 비밀번호입니다.");
		form.pswd.value="";
		form.pswd.focus();
		return false;
	}
	
	form.submit();
}

function signUpValidityCheck(){
	var idRegexp = /^[a-zA-Z0-9]{4,16}$/;
	var pwRegexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
		
	var form = document.login;
	
	if (form.id.value == ""){
		alert("아이디를 입력하십시오.");
		form.id.focus();
		return false;
	}
	
	if (!idRegexp.test(form.id.value)){
		alert("적절하지 못한 ID입니다.");
		form.id.value="";
		form.id.focus();
		return false;
	}
	
	if (form.pswd.value == ""){
		alert("비밀번호를 입력하십시오.");
		form.pswd.focus();
		return false;
	}
	
	if (!pwRegexp.test(form.pswd.value)){
		alert("적절하지 못한 비밀번호입니다.");
		form.pswd.value="";
		form.pswd.focus();
		return false;
	}

	if (form.pswd.value != form.checkpswd.value){
		alert("비밀번호 확인을 정확히 입력하십시오.");
		form.pswd.focus();
		return false;
	}

	if (form.username.value == ""){
		alert("이름을 입력하십시오.");
		form.username.focus();
		return false;
	}

	if (form.phone1.value == "" || form.phone2.value == "" || form.phone3.value == ""){
		alert("올바르게 전화번호를 입력하십시오.");
		form.phone1.focus();
		return false;
	}


	form.submit();
}

function EditProfileCheck(){
	var form = document.modify;

	if (form.name.value == ""){
		alert("이름을 입력하십시오.");
		form.pswd.focus();
		return false;
	}

	if (form.phone1.value == "" || form.phone2.value == "" || form.phone3.value == ""){
		alert("올바르게 전화번호를 입력하십시오.");
		form.userID.focus();
		return false;
	}

	form.submit();
}