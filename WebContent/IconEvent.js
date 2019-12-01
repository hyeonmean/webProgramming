
var likeState=0;
var bookMarkState=0;
var followState=0;

$(function(){
	$('.follow-status').click(function(){
		
	      if(followState==0){
	        $(this).css("background","orangered");
	        $(this).css("color","white");
	        $(this).css("font-weight","bold");
	        $(this).css("transition","300ms ease all");
	        followState=1;
	      }
	      else{
		    $(this).css("background","rgb(250,250,250)");
		    $(this).css("border","1px solid orangered;");
		    $(this).css("font-weight","300");
		    $(this).css("color","orangered");
		    $(this).css("transition","300ms ease all");
	        followState=0;
	      }
	  });
});

$(function(){
  $('.fa-heart').click(function(){
      if(likeState==0){
        $(this).css("color","rgb(255, 78, 78)");
        $(this).css("font-weight","900");
        $(this).css("transition","500ms ease all");
        likeState=1;
      }
      else{
        $(this).css("color","black");
        $(this).css("font-weight","100");
        $(this).css("transition","650ms ease all");
        likeState=0;
      }
      
  });
});


{/* <script type="text/javascript"> */}
$(function(){
  $('.fa-bookmark').click(function(){
      if(bookMarkState==0){
        $(this).css("font-weight","900");
        $(this).css("transition","300ms ease all");
        bookMarkState=1;
      }
      else{
        $(this).css("font-weight","100");
        $(this).css("transition","350ms ease all");
        bookMarkState=0;
      }
  });
});
{/* </script> */}


