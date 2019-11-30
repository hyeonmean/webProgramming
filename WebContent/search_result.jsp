<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
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
        <%
            request.setAttribute("searchKeyword", (String)request.getAttribute("searchKeyword"));
        %>
        <jsp:include page="SearchProcess.jsp"/>
        <button class="back" onclick="history.go(-1);"></button>
        <div onclick="history.go(-1);"><i class="fas fa-arrow-left"></i></div>      
        <script type="text/javascript">
        	
        	printKeyword('<%=(String)request.getAttribute("keyword")%>');
        	
		</script>
        <div class="SameLayout" style="margin-top: 25px; margin-left:35px; margin-right:35px;">     

              <%
                  ArrayList<Integer> postList_temp = new ArrayList<Integer>();
                  ArrayList<String> pictureList_temp = new ArrayList<String>();

                  postList_temp = (ArrayList<Integer>)request.getAttribute("postList");
                  pictureList_temp = (ArrayList<String>)request.getAttribute("pictureList");
              %>

            <script type="text/javascript">
                  var post_array = new Array();
                  var picture_array = new Array();
                  <%for(int i=0; i<postList_temp.size(); i++){%>
                      post_array.push(<%=(Integer)postList_temp.get(i)%>);
                      alert(post_array[i]);
                      picture_array.push('<%=(String)pictureList_temp.get(i)%>');
                  <%}%>
               searchListPrint(post_array, picture_array)
            </script>
		</div>
		
    </body>
</html>