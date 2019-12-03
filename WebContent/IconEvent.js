
var likeState=0;
var bookMarkState=0;
var followState=0;

function Request(){

	var requestParam ="";
        this.getParameter = function(param){
    	var url = unescape(location.href); //현재 주소를 decoding
        var paramArr = url.substring(url.indexOf("=")+1,url.length); //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 

        for(var i = 0 ; i < paramArr.length ; i++){
            var temp = paramArr[i].split("="); //파라미터 변수명을 담음

            if(temp[0].toUpperCase() == param.toUpperCase()){
            	requestParam = paramArr[i].split("=")[1]; // 변수명과 일치할 경우 데이터 삽입
                break;
            }
        }
        return requestParam;
    };
    
    this.geturl = function(){
    	var url = unescape(location.href); //현재 주소를 decoding
        var paramArr = url.substring(url.indexOf("=")+1,url.length); //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
        
        return paramArr;
    };
}



$(function(){
	$('.follow-status').click(function(){
		  var temp = "rgb(255, 69, 0)";
		  var request = new Request();
		  var location = "FollowProcess.jsp?postIdx=";
		  var location2 = "UnFollowProcess.jsp?postIdx=";
		  var url = request.geturl();
		  var realUrl = location.concat(url);
		  var url2 = request.geturl();
		  var realUrl2 = location.concat(url2);
	      if($(this).css("color") == temp){
	        $(this).css("background","orangered");
	        $(this).css("color","white");
	        $(this).css("font-weight","bol d");
	        $(this).css("transition","300ms ease all");
	        
	        window.location.href=realUrl;
	        
	      }
	      else{
		    $(this).css("background","rgb(250,250,250)");
		    $(this).css("border","1px solid orangered;");
		    $(this).css("font-weight","300");
		    $(this).css("color","orangered");
		    $(this).css("transition","300ms ease all");


	        location.href=realUrl2;
	        
	     }
	  });
});
$(function(){
  $('.fa-heart').click(function(){
    var temp2 = "rgb(0, 0, 0)";
	var request = new Request();
	var location = "FavoriteProcess.jsp?postIdx=";
	var location2 = "UnFavoriteProcess.jsp?postIdx=";
	var url = request.geturl();
	var realUrl = location.concat(url);
	var url2 = request.geturl();
	var realUrl2 = location.concat(url2);
    if($(this).css("color") == temp2){
        $(this).css("color","rgb(255, 78, 78)");
        $(this).css("font-weight","900");
        $(this).css("transition","500ms ease all");
        location.href=realUrl;

      }
      else{
        $(this).css("color","black");
        $(this).css("font-weight","100");
        $(this).css("transition","650ms ease all");
        location.href=realUrl2;
      }
      
  });
});


{/* <script type="text/javascript"> */}
$(function(){
  $('.fa-bookmark').click(function(){
    var temp3 = "400";
    var request = new Request();
    var location = "BookMarkProcess.jsp?postIdx=";
	var location2 = "UnBookMarkProcess.jsp?postIdx=";
	var url = request.geturl();
	var realUrl = location.concat(url);
	var url2 = request.geturl();
	var realUrl2 = location.concat(url2);
    if($(this).css("font-weight") == temp3){
        $(this).css("font-weight","900");
        $(this).css("transition","300ms ease all");
        
        location.href=realUrl;
        
      }
      else{
        $(this).css("font-weight","400");
        $(this).css("transition","350ms ease all");
        
        location.href=realUrl2;
        
      }
  });
});
{/* </script> */}


