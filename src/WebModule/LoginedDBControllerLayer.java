package WebModule;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Date;

import java.sql.*;

import WebModule.*;
import WebModule.User.Builder;

//일반유저와 관리자 둘 다 사용하는
//추상 클래스
public abstract class LoginedDBControllerLayer extends DBController {
	
	protected User userInfo;
	
	protected LoginedDBControllerLayer(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase);
		userInfo = newUser;
	}
	
	// 쿼리문을 사용한 DB처리
	// 보통 SQLException이 뜬 것은
	// 실패했다는 것을 의미한다.
	
	//좋아요, 안좋아요
	//parameter -> 게시글 인덱스
	//좋아요
	//@param -> int postIdx -> 게시글 번호
	public boolean favorite(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.FAVORITE);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  this.userInfo.getId());
		pstmt.executeUpdate();
		return true;
	}
	
	//안좋아요
	//@param -> int postIdx -> 게시글 번호
	public boolean disFavofite(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.UNFAVORITE);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  this.userInfo.getId());
		pstmt.executeUpdate();
		return true;
	}
	
	//팔로우, 언팔로우
	public boolean follow(String followingId) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.FOLLOW);
		pstmt.setString(1, this.userInfo.getId());
		pstmt.setString(2, followingId);
		pstmt.executeUpdate();
		
		return true;
	}
	
	public boolean unFollow(String followingId) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.UNFOLLOW);
		pstmt.setString(1, this.userInfo.getId());
		pstmt.setString(2, followingId);
		pstmt.executeUpdate();
		return true;
	}
	
	//북마크 설정 해제
	//인자값 -> 게시글 인덱스
	public boolean setBookMark(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.SET_BOOKMARK);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2, this.userInfo.getId());
		pstmt.executeUpdate();
		return true;
	}
	
	public boolean unSetBookMark(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.UNSET_BOOKMARK);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  this.userInfo.getId());
		pstmt.executeUpdate();
		return true;
	}
	
	// 프로필 수정
	/*
	 * 프로필 수정은
	 * 자기 자신의 userinfo의 데이터를 그대로
	 * DB에 업데이트 하며
	 * 이를 수행 하기 전에
	 * set메소드로 데이터를 수정해야 한다.
	 */
	public boolean editProfile() throws Exception {
		
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(QueryList.EDIT_PROFILE);
		
		pstmt.setString(1,  userInfo.getName());
		pstmt.setString(2, userInfo.getPhoneNumber());
		
		//성별 널값 여부
		if(userInfo.getGender() == null) {
			pstmt.setString(3, Gender.Unknown.getTable1Value());
		} else {
			pstmt.setString(3, userInfo.getGender().getTable1Value());
		}
		
		//자기소개 여부
		if( userInfo.getLetter() == null) {
			pstmt.setNull(4, Types.VARCHAR);
		} else if(userInfo.getLetter().length() == 0 ) {
			pstmt.setNull(4, Types.VARCHAR);
		} else {
			pstmt.setString(4, userInfo.getLetter());
		}
		
		//데이트 널값 여부
		if(userInfo.getDate() != null) {
			Calendar birthDay = userInfo.getDate();
			
			//date
			pstmt.setDate(5, (java.sql.Date) new Date(birthDay.getTimeInMillis()));
			
		} else {
			pstmt.setNull(5, Types.DATE);
		}
		pstmt.setString(6, userInfo.getId());
		
		//쿼리문 수행
		pstmt.executeUpdate();
		pstmt.close();
		
		return true;
	}
	
	//게시글 올리기
	public boolean writePostPage(String comment, ArrayList<String> pictureList, ArrayList<String> hashTagList) 
		throws Exception {
		
		PreparedStatement pstmt = null;
		
		//데이터 침범을 방지하기 위한 트랜잭션 설정
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		pstmt.close();
		//트랜젝션을 걸어놓았기 때문에 예외처리 안하면 터짐
		try  {
			//일단 게시글부터 올리자
			pstmt = this.conn.prepareStatement(QueryList.MakePostPage.MAKE_POST_PAGE);
			pstmt.setString(1,  this.userInfo.getId());
			pstmt.setString(2, comment);
			pstmt.executeUpdate();
			pstmt.close();
			
			//올린 후 게시글 인덱스 갖고오기
			pstmt = this.conn.prepareStatement(QueryList.MakePostPage.GET_POST_IDX);
			ResultSet result = pstmt.executeQuery();
			
			result.next();
			int postIdx = result.getInt("@result");
			pstmt.close();
			
			//해시태그를 올리자
			if(hashTagList != null) {
				Iterator<String> cursor = hashTagList.iterator();
				pstmt = this.conn.prepareStatement(QueryList.MakePostPage.UPLOAD_HASHTAG);
				while(cursor.hasNext()) {
					
					String tagName = cursor.next();
					pstmt.setString(1, tagName);
					pstmt.setInt(2, postIdx);
					pstmt.executeUpdate();
				}
				pstmt.close();
			}
			
			//파일 업로드는 jsp에서 처리
			
			//파일 주소를 업로드하자
			if(pictureList != null) {
				Iterator<String> cursor = pictureList.iterator();
				pstmt = this.conn.prepareStatement(QueryList.MakePostPage.UPLOAD_PICTURE);
				while(cursor.hasNext()) {
					String address = cursor.next();
					pstmt.setInt(1, postIdx);
					pstmt.setString(2, address);
					pstmt.executeUpdate();
				}
				pstmt.close();
			}
			
			//완료
			pstmt = this.conn.prepareStatement(QueryList.COMMIT);
			pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch(Exception e) {
			pstmt = this.conn.prepareStatement(QueryList.ROLLBACK);
			pstmt.executeUpdate();
			pstmt.close();
			throw e;
		}
		return true;
	}
	
	//댓글 달기
	//에러 시 예외
	//댓글 달기 실패(인덱스에 해댱하는 게시글 없음) 시 false 반환
	public boolean writeComment(int postIdx, String comment) throws SQLException {
		
		PreparedStatement pstmt = null;
		//결과값을 가져와야 하므로 트랜젝션 설정
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		
		// 댓글 올리기
		try {
			pstmt = this.conn.prepareStatement(QueryList.WRITE_COMMENT);
		
			pstmt.setInt(1, postIdx);
			pstmt.setString(2, userInfo.getId());
			pstmt.setString(3,  comment);
		
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = this.conn.prepareStatement(QueryList.GET_RESULT);
			ResultSet rSet = pstmt.executeQuery();
			
			rSet.next();
			int result = rSet.getInt("@result");
			rSet.close();
			pstmt.close();
			
			//성공 시 끝내기
			pstmt = this.conn.prepareStatement(QueryList.COMMIT);
			pstmt.executeUpdate();
			pstmt.close();
			if(result == -1)
				return false;
			return true;
			
		} catch(Exception e) {
			pstmt = this.conn.prepareStatement(QueryList.ROLLBACK);
			pstmt.executeUpdate();
			pstmt.close();
			throw e;
		}
	}	
	
	
	//인덱스로 게시글 정보 찾기(최소 단위 연산)
	//디비에러 -> Exception
	//성공시 PostPage
	//실패시 null
	public PostPage searchPostPageByPostIdx(int postIdx) throws Exception {
		
		PostPage resultPostPage = null; //리턴값
		PreparedStatement pstmt = null;
		
		//해당 인덱스에 존재하는 게시글이 있는 지 확인
		pstmt = this.conn.prepareStatement(QueryList.IS_POSTPAGE_EXIST);
		pstmt.setInt(1, postIdx);
		
		ResultSet rSet = pstmt.executeQuery();
		//없어짐
		rSet.next();
		if(rSet.getInt("success") == 0)
			return null;
		rSet.close();
		pstmt.close();
		
		//포스트페이지 데이터 뽑아내기
		//1.기본 데이터 뽑아내기
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_POSTPAGE_BY_IDX);
		pstmt.setInt(1, postIdx);
		
		//데이터 받기
		rSet = pstmt.executeQuery();
		rSet.next();
		
		String userId = rSet.getString("userId");
		String comment = rSet.getString("comment");
		Calendar writeDate = Calendar.getInstance();
		writeDate.setTime(rSet.getDate("writeDate"));
		
		//Builder 생성
		PostPage.Builder builder = new PostPage.Builder(postIdx, userId, comment, writeDate);
		
		rSet.close();
		pstmt.close();
		
		//그림 인덱스 찾기
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_PICTURE_IDX_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<Integer> pictureIdxList = new ArrayList<>();
		while(rSet.next())
			pictureIdxList.add(rSet.getInt("pictureIdx"));
		rSet.close();
		pstmt.close();
		
		//해쉬데이터 찾기
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_HASHTAG_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<String> hashTagList = new ArrayList<>();
		while(rSet.next())
			hashTagList.add(rSet.getString("tagName"));
		rSet.close();
		pstmt.close();
		
		//댓글 인덱스 찾기
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_COMMENT_IDX_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<Integer> commentIdxList = new ArrayList<>();
		while(rSet.next())
			commentIdxList.add(rSet.getInt("idx"));
		rSet.close();
		pstmt.close();
		

		//좋아요 리스트 찾기
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SERACH_FAVORITE_USER_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
	
		ArrayList<String> favoriteList = new ArrayList<>();
		while(rSet.next())
			favoriteList.add(rSet.getString("userId"));
		rSet.close();
		pstmt.close();
		
		//추가
		builder.pictureList(pictureIdxList)
			.commentList(commentIdxList)
			.hashTagList(hashTagList)
			.favoriteList(favoriteList);		
		
		//빌드하고 리턴
		resultPostPage = builder.build();
		return resultPostPage;
		
	}
	//있으면 Picture
	//없으면 null 처리
	public Picture searchPictureDataByIdx(int pictureIdx) throws Exception {
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(QueryList.SEARCH_PICTURE_DATA_BY_IDX);
		pstmt.setInt(1, pictureIdx);
		ResultSet rSet = pstmt.executeQuery();
		
		if(rSet.next() == false)
			return null;
		
		int postIdx = rSet.getInt("postIdx");
		String address = rSet.getString("pictureAddress");
		
		Picture resultPictureData = new Picture(pictureIdx, postIdx, address);
		return resultPictureData;
	}
	
	//댓글 데이터 찾기
	//있으면 데이터, 없으면 null
	public PostComment searchPostCommentDataByIdx(int commentIdx) throws Exception {
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(QueryList.SEARCH_COMMENT_DATA_BY_IDX);
		pstmt.setInt(1, commentIdx);
		ResultSet rSet = pstmt.executeQuery();
		
		if(rSet.next() == false)
			return null;
		
		// 데이터 추출
		int postIdx = rSet.getInt("postIdx");
		String userId = rSet.getString("userId");
		String comment = rSet.getString("comment");
		Calendar cal = Calendar.getInstance();
		cal.setTime(rSet.getDate("writeDate"));
		
		PostComment postComment =
				new PostComment(commentIdx, postIdx, userId, comment, cal);
		return postComment;
	}
	
	
	//유저 데이터 갖고 오기
	//없으면 널 처리
	public User searchAboutUser(String id) throws Exception {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.HAVE_SAME_ID);
		pstmt.setString(1, id);
		ResultSet rSet = pstmt.executeQuery();
		
		rSet.next();
		int result = rSet.getInt("success");
		if( result == 0)
			return null;
		else {
			// 유저 데이터 갖고 오기
			rSet.close();
			pstmt.close();
			pstmt = this.conn.prepareStatement("select * from User where id = ?");
			pstmt.setString(1, id);
			rSet = pstmt.executeQuery();
			
			//다음으로 넘겨야 데이터를 받을 수 있음
			rSet.next();
			
			// User를 만들기 위한 빌더 생성
			User.Builder builder = new Builder(
				rSet.getString("id"), rSet.getString("pswd"),
				rSet.getString("name"), rSet.getString("phoneNumber"),
				rSet.getBoolean("isManager"), rSet.getBoolean("locked")
			);
			builder.age(rSet.getInt("age"));
			
			//나이
			Gender gender = null;
			if(rSet.getString("gender").equals("male") )
				gender = Gender.Male;
			else if( rSet.getString("gender").equals("female") )
				gender = Gender.Female;
			else
				gender = Gender.Unknown;
			builder.gender(gender);
			
			//자기소개
			builder.letter(rSet.getString("letter"));
			//사진 주소
			builder.profilePictureAddress(rSet.getString("profileAddress"));
			
			//생일인데 Date가 리턴값이므로 Calendar로 전환
			Date tmpDate = rSet.getDate("birthday");
			
			
			//null값이 아니면 처리
			if(tmpDate != null) {
				Calendar cal = Calendar.getInstance();
				
				cal.setTime(tmpDate);
				builder.date(cal);
			}
			else //null값이면 null값 집어넣기
			{
				builder.date(null);
			}
			pstmt.close();
			rSet.close();
			
			//빌드!
			return builder.build();
		}
	}
	
	//해당 유저가 팔로잉한 다른 유저의 아이디 찾기
	public ArrayList<String> searchFollowerUser(String followingID) throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareCall(QueryList.SEARCH_FOLLOWER_USER);
		pstmt.setString(1, followingID);
		
		//데이터 갖고오기
		ResultSet rSet = pstmt.executeQuery();

		ArrayList<String> resultList = new ArrayList<>();
		
		while(rSet.next())
			resultList.add(rSet.getString("followerID"));
		
		rSet.close();
		pstmt.close();
		
		return resultList;
		
	}
	public ArrayList<String> searchFollowingUser(String followerID) throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.SEARCH_FOLLOWING_USER);
		pstmt.setString(1, followerID);
		
		ResultSet rSet = pstmt.executeQuery();
		ArrayList<String> resultList = new ArrayList<>();
		
		while(rSet.next())
			resultList.add(rSet.getString("followingID"));
		rSet.close();
		pstmt.close();
		
		return resultList;
	}
	
	//뉴스피드
	//게시글 인덱스 리스트
	public ArrayList<Integer> getNewsFeed() throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.GET_NEWSFEED);
		pstmt.setString(1, userInfo.getId());
		
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<Integer> postIdxList = new ArrayList<>();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("postIdx"));
		rSet.close();
		pstmt.close();
		
		pstmt = this.conn.prepareStatement("select postIdx from PostPage where id = ?");
		pstmt.setString(1, userInfo.getId());
		rSet = pstmt.executeQuery();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("postIdx"));
		rSet.close();
		pstmt.close();
		return postIdxList;
		
	}
	
	//해시태그에 따른 게시글 인덱스 리스트 불러오기
	public ArrayList<Integer> getPostPageIdxByHashTag(String tagName) throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.GET_POST_BY_HASHTAG);
		pstmt.setString(1, tagName);
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<Integer> postIdxList = new ArrayList<>();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("pp.postIdx"));
		rSet.close();
		pstmt.close();
		
		return postIdxList;
	}
	
	//삭제관련 기능은 권한에 따라 다름
	public abstract boolean deletePostPage(int postIdx) throws Exception;
	public abstract boolean deleteComment(int cmtIdx) throws Exception;


}