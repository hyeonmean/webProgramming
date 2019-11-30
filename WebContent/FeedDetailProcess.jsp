<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="WebModule.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int postIdx = (int)request.getAttribute("postIdx");
	UserDBController dbc=(UserDBController)session.getAttribute("DBController");
	dbc.openDataBase();
	
	PostPage postPage = dbc.searchPostPageByPostIdx(postIdx);
	String userID = postPage.getUserId();
	String letter = postPage.getComment();
	
	Picture picture = dbc.searchPictureDataByIdx(postPage.getPictureList().get(0).intValue());
	
	//그림 주소
	String pictureAddress = picture.getPictureAddress();
	Calendar writeDate = postPage.getUpdateData();
	
	ArrayList<Integer> commentIdxList = postPage.getCommentList();
	
	request.setAttribute("userId", userID);
	request.setAttribute("letter", letter);
	request.setAttribute("pictureAddress", pictureAddress);
	
	request.setAttribute("dateToStr", writeDate);
	
	request.setAttribute("numberOfFavorite", postPage.getFavoriteList().size());
	
	//유저의 사진
	User writeUser = dbc.searchAboutUser(userID);
	request.setAttribute("writeUserPicAddress", writeUser.getProfilePictureAddress());
	

	ArrayList<String> userIdList = new ArrayList<String>();
	ArrayList<Integer> cmtIdxList = new ArrayList<Integer>();
	ArrayList<String> cmtList = new ArrayList<String>();
	ArrayList<String> dateList = new ArrayList<String>();
	ArrayList<String> userPicAddressList = new ArrayList<String>();
	
	if(commentIdxList.size() == 0) {
		request.setAttribute("empty", true);
	} else {
		request.setAttribute("empty", false);

		for(Integer i: commentIdxList) {
			
			PostComment pc = dbc.searchPostCommentDataByIdx(i);
			
			userIdList.add(pc.getUserId());
			cmtIdxList.add(pc.getCommentIdx());
			cmtList.add(pc.getComment());
			
			Calendar cal = (Calendar)pc.getwriteDate();
			String dateToStr = cal.get(Calendar.YEAR)+"-"
					+ (cal.get(Calendar.MONTH)+1)+"-"
					+ cal.get(Calendar.DAY_OF_MONTH)+" "
					+ cal.get(Calendar.HOUR)+":"
					+ cal.get(Calendar.MINUTE)+":"
					+ cal.get(Calendar.SECOND);
			dateList.add(dateToStr);
			
			//댓글단 유저 이름
			User commentUser = dbc.searchAboutUser(pc.getUserId());
			userPicAddressList.add(commentUser.getProfilePictureAddress());
			
			
		}
		
		request.setAttribute("userIdList", userIdList);
		request.setAttribute("cmtIdxList", cmtIdxList);
		request.setAttribute("cmtList", cmtList);
		request.setAttribute("dateList", dateList);
		request.setAttribute("userPicAddressList", userPicAddressList);
	}
%>
</body>
</html>