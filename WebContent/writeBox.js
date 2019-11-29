$(document).ready(function(){
    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  

    });      

});

function wrapWindowByMask(){
 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height()*3;  
    var maskWidth = $(window).width()*3;  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    // $("#mask").css({"width":100%,"height":maskWidth});    
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".window").show();

}

function showImg(){                        
    document.getElementById("ex_file").onchange = function () {
    var reader = new FileReader();
    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("image").src = e.target.result;
    };
    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};
}

function writeBoxPrint(){
    var userID ="what", locationOfProfileImg="new.jpg"
    var writeBoxTemplate = `
    <div class="writeBox">
        <div class="MainLayout">
            <form action="PostProcess.jsp" method="post">
                <div class="NameBar">
                    <a href="mypage.jsp">
                        <div id="ProfilePhoto"><img src=${locationOfProfileImg}/></div>
                        <button id="profile">${userID}</button>
                    </a>
       
                   </div>
                   <div class="contentbox">
                        <div class="imagebox">
                            <img id="image"/>
                        </div>
                        <textarea class="textbox" placeholder="내용을 입력하세요 :)"></textarea>
                    </div>
                    <div class="bottom">
                        <div class="filebox">
                            <label for="ex_file"><i class="fas fa-camera"></i></label>
                            <input type="file" id="ex_file" accept=".jpg,.jpeg,.png,.gif" onchange="LoadImg(this);">
                            <script>
                                showImg();
                            </script>
                        </div>
                        <button class="submitbox" type="button">
                            <label><i class="fas fa-paper-plane"></i></label>
                        </button>
                    </div>
            </form>
        </div>
    </div>
    `

    document.write(writeBoxTemplate);
}