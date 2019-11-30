function settingByMask(){
 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height()*3;  
    var maskWidth = $(window).width()*3;  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    // $("#mask").css({"width":100%,"height":maskWidth});    
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#s-mask").fadeIn(0);      
    $("#s-mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".setting-box").show();

}

$(document).ready(function(){
    //검은 막 띄우기
    $(".fa-ellipsis-h").click(function(e){
        e.preventDefault();
        settingByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".setting-box .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#s-mask, .setting-box").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#s-mask").click(function () {  
        $(this).hide();  
        $(".setting-box").hide();  

    });      

});



function userByMask(){
	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height()*3;  
    var maskWidth = $(window).width()*3;  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    // $("#mask").css({"width":100%,"height":maskWidth});    
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#u-mask").fadeIn(0);      
    $("#u-mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".user-box").show();

}

$(document).ready(function(){
    //검은 막 띄우기
    $(".fa-user").click(function(e){
        e.preventDefault();
        userByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".user-box .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#u-mask, .user-box").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#u-mask").click(function () {  
        $(this).hide();  
        $(".user-box").hide();  

    });      

});
