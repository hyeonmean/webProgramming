
var likeState=0;
var bookMarkState=0;

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
