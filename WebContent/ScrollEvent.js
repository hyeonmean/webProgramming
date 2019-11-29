
var imgs = "";

$(document).ready(function(){
    //스크롤 발생 이벤트 처리
    $(window).scroll(function(){
        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
        var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
        var contentH = $('body').height(); //문서 전체 내용을 갖는 div의 높이
        if(scrollT + scrollH  >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
        	
        	var theNumberOfSearchResult = 30;
        	var locationList = new Array();
        	
        	
        	
        	for(var j = 1; j < theNumberOfSearchResult; j++){
        		imgs += `<a href="FeedDetail.jsp"><figure><img src="./sample/ootd/rename${j%21}.jpg"/></figure></a>`;
        	}
        	
            //여기에 div태그 동적으로 생성해 imgs에 저장하면 됨

            $('.columns').append(imgs);
            
        }
    });
});
