<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>
<%@ include file="global.jsp"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">alert("check")</script>
	<%
	UserDBController dbc= new UserDBController("bakhwaproject.tk", "backdev02", "bdev02", "backdev02", g_user);
	dbc.openDataBase();
	boolean check=false;
	
	String tag="";
	
	PostPage post=new PostPage();
	
	String comment=request.getParameter("comment");
	String[] comment_main=comment.split("#");
	int count=comment_main.length;
	ArrayList<String> tagList=new ArrayList<String>();
	
	for(int i=1; i<count; i++){
		tag=comment_main[i];
		//fulltag=tag.concat(comment_main[i]);
		tagList.add(tag);
	}
	
	int pictureidx;
	ArrayList<String> hashTagList=new ArrayList<String>();
	ArrayList<String> pictureList=new ArrayList<String>();
	
	//String comment=request.getParameter("name");
	String savePath=request.getRealPath("/uploadFile/post/");
	
	post.findHashTag(comment);
	
	String uploadFile = "";
	 
    // 실제 저장할 파일명
    String newFileName = "";
	
	int maxSize=1024*1024*10;
	int read=0;
	byte[] buf=new byte[1024];
	
	String name ="";
    String subject ="";
     
    /*String fileName1 ="";// 중복처리된 이름
    String originalName1 ="";// 중복 처리전 실제 원본 이름
    long fileSize =0;// 파일 사이즈
    String fileType ="";// 파일 타입*/
    
    FileInputStream fin = null;
    FileOutputStream fout = null;
    long currentTime = System.currentTimeMillis(); 
    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	
	MultipartRequest multi =null;

	try{
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi =new MultipartRequest(request,savePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
         
    	 // 파일업로드
        //uploadFile = multi.getFilesystemName("name정하고");
 
        // 실제 저장할 파일명(ex : 20140819151221.zip)
        newFileName = simDf.format(new Date(currentTime));
 
         
        // 업로드된 파일 객체 생성
        File oldFile = new File(savePath + uploadFile);
 
         
        // 실제 저장될 파일 객체 생성
        File newFile = new File(savePath + newFileName + g_user.getId());
        pictureList.add(savePath + newFileName + g_user.getId());
         
 
        // 파일명 rename
        if(!oldFile.renameTo(newFile)){
 
            // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
 
            buf = new byte[1024];
            fin = new FileInputStream(oldFile);
            fout = new FileOutputStream(newFile);
            read = 0;
            while((read=fin.read(buf,0,buf.length))!=-1){
                fout.write(buf, 0, read);
            }
             
            fin.close();
            fout.close();
            oldFile.delete();
        }  
 
    }catch(Exception e){
        e.printStackTrace();
    }


	//picturename=postindx_num
	//postindex=??
	
	check=dbc.writePostPage(comment, pictureList, tagList);
	dbc.closeDataBase();
	
	response.sendRedirect("NewsFeed.jsp");
	%>
</body>
</html>