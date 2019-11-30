<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>


<html>
    <head>
    <!-- 占싯삼옙占쏙옙占� 占쏙옙占쏙옙占쏙옙, 占싯삼옙占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙占싸븝옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌨아와억옙占쏙옙 -->
        <meta charset="utf-8"/>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="./ScrollEvent.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
        <link rel="stylesheet" href="./css/common.css" type="text/css" />
        <link rel="stylesheet" href="./css/search_result.css" type="text/css" />
        <script type="text/javascript" src="./setting.js"></script>

    </head>
    <body>
    	<script type="text/javascript" src="dynamicSearch.js"></script>
  		<jsp:include page="navbar.jsp"/>
        <button class="back" onclick="history.go(-1);"></button>
        <div onclick="history.go(-1);"><i class="fas fa-arrow-left"></i></div>      
        <script type="text/javascript">
        	
        	printKeyword();
        	
		</script>
        <div class="SameLayout" style="margin-top: 25px; margin-left:35px; margin-right:35px;">        
        <script type="text/javascript">

        	searchListPrint();
		</script>
		</div>
		
    </body>
</html>