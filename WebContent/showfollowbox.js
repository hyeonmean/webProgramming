function followByMask(){
 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height()*3;  
    var maskWidth = $(window).width()*3;  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    // $("#mask").css({"width":100%,"height":maskWidth});    
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#f-mask").fadeIn(0);      
    $("#f-mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".f-followevent").show();

}

$(document).ready(function(){
    //검은 막 띄우기
    $(".follow-count").click(function(e){
        e.preventDefault();
        followByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".f-followevent .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#f-mask, .f-followevent").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#f-mask").click(function () {  
        $(this).hide();  
        $(".f-followevent").hide();  

    });      

});

function followerByMask(){
	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height()*3;  
    var maskWidth = $(window).width()*3;  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    // $("#mask").css({"width":100%,"height":maskWidth});    
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#f2-mask").fadeIn(0);      
    $("#f2-mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".f2-followevent").show();

}

$(document).ready(function(){
    //검은 막 띄우기
    $(".follower-count").click(function(e){
        e.preventDefault();
        followerByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".f2-followevent .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#f2-mask, .f2-followevent").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#f2-mask").click(function () {  
        $(this).hide();  
        $(".f2-followevent").hide();  

    });      

});

