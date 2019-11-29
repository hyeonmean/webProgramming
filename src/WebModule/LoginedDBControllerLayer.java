package WebModule;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Date;

import java.sql.*;

import WebModule.User;
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
	
	
	//삭제관련 기능은 권한에 따라 다름
	public abstract boolean deletePostPage(int postIdx) throws Exception;


}