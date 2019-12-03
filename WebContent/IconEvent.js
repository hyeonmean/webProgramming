
var likeState=0;
var bookMarkState=0;
var followState=0;

$(function(){
	$('.follow-status').click(function(){
		  var temp = "rgb(255, 69, 0)";
	      if($(this).css("color") == temp){
	        $(this).css("background","orangered");
	        $(this).css("color","white");
	        $(this).css("font-weight","bol d");
	        $(this).css("transition","300ms ease all");
	        location.href="FollowProcess.jsp?<%=postIdx%>";
	      }
	      else{
		    $(this).css("background","rgb(250,250,250)");
		    $(this).css("border","1px solid orangered;");
		    $(this).css("font-weight","300");
		    $(this).css("color","orangered");
		    $(this).css("transition","300ms ease all");
		    location.href="UnFollowProcess.jsp?<%=postIdx%>";
	     }
	  });
});

$(function(){
  $('.fa-heart').click(function(){
    var temp2 = "rgb(0, 0, 0)";
      if($(this).css("color") == temp2){
        $(this).css("color","rgb(255, 78, 78)");
        $(this).css("font-weight","900");
        $(this).css("transition","500ms ease all");
        location.href="favoriteProcess.jsp?<%=postIdx%>";

      }
      else{
        $(this).css("color","black");
        $(this).css("font-weight","100");
        $(this).css("transition","650ms ease all");
        location.href="UnfavoriteProcess.jsp?<%=postIdx%>";
      }
      
  });
});


{/* <script type="text/javascript"> */}
$(function(){
  $('.fa-bookmark').click(function(){
    var temp3 = "400";
      if($(this).css("font-weight") == temp3){
        $(this).css("font-weight","900");
        $(this).css("transition","300ms ease all");
        location.href="BookMark.jsp?<%=postIdx%>";
        
      }
      else{
        $(this).css("font-weight","400");
        $(this).css("transition","350ms ease all");
        location.href="UnBookMark.jsp?<%=postIdx%>";
        
      }
  });
});
{/* </script> */}


