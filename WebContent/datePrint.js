function dateBox(){
	var nowYear = new Date().getFullYear();
	var index = 0;
	document.write('<select id="select_year" name="user_birth_year" onchange="dayChangeBelongToMonth();"></select>년');
	for(var i = 2019; i > 1899; i--){
		document.getElementById("select_year").options[index++] = new Option(i, i);
	}
	
	index = 0;
	document.write('<select id="select_month" name="user_birth_month" onchange="dayChangeBelongToMonth();"></select>월');
	for(var i = 1; i < 13; i++){
		document.getElementById("select_month").options[index++] = new Option(i, i);
	}
	document.write('<select id="select_day" name="user_birth_day"></select>일');

	dayChangeBelongToMonth();
}

function dayChangeBelongToMonth(){
	var Year=document.getElementById('select_year').value;
	var Month=document.getElementById('select_month').value;
	var day=new Date(new Date(Year,Month,1)-86400000).getDate();
	var dayindex_len=document.getElementById('select_day').length;
	
	if(day>dayindex_len){
		for(var i=(dayindex_len+1); i<=day; i++){
			document.getElementById('select_day').options[i-1] = new Option(i, i);
		}
	}
	else if(day<dayindex_len){
		for(var i=dayindex_len; i>=day; i--){
			document.getElementById('select_day').options[i]=null;
		}
	}
}