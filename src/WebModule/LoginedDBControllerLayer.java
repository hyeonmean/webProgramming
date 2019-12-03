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

//�Ϲ������� ������ �� �� ����ϴ�
//�߻� Ŭ����
public abstract class LoginedDBControllerLayer extends DBController {
	
	protected User userInfo;
	
	protected LoginedDBControllerLayer(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase);
		userInfo = newUser;
	}
	
	public User getUser() { return userInfo; }
	
	// �������� ����� DBó��
	// ���� SQLException�� �� ����
	// �����ߴٴ� ���� �ǹ��Ѵ�.
	
	//���ƿ�, �����ƿ�
	//parameter -> �Խñ� �ε���
	//���ƿ�
	//@param -> int postIdx -> �Խñ� ��ȣ
	

	public boolean favorite(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.FAVORITE);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  this.userInfo.getId());
		pstmt.executeUpdate();

		return true;
	}
	
	//�����ƿ�
	//@param -> int postIdx -> �Խñ� ��ȣ
	public boolean disFavofite(int postIdx) throws SQLException {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.UNFAVORITE);
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  this.userInfo.getId());
		pstmt.executeUpdate();
		return true;
	}
	
	//�ȷο�, ���ȷο�
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
	
	//�ϸ�ũ ���� ����
	//���ڰ� -> �Խñ� �ε���
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
	
	// ������ ����
	/*
	 * ������ ������
	 * �ڱ� �ڽ��� userinfo�� �����͸� �״��
	 * DB�� ������Ʈ �ϸ�
	 * �̸� ���� �ϱ� ����
	 * set�޼ҵ�� �����͸� �����ؾ� �Ѵ�.
	 */
	public boolean editProfile() throws Exception {
		
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(QueryList.EDIT_PROFILE);
		
		pstmt.setString(1,  userInfo.getName());
		pstmt.setString(2, userInfo.getPhoneNumber());
		
		//���� �ΰ� ����
		if(userInfo.getGender() == null) {
			pstmt.setString(3, Gender.Unknown.getTable1Value());
		} else {
			pstmt.setString(3, userInfo.getGender().getTable1Value());
		}
		
		//�ڱ�Ұ� ����
		if( userInfo.getLetter() == null) {
			pstmt.setNull(4, Types.VARCHAR);
		} else if(userInfo.getLetter().length() == 0 ) {
			pstmt.setNull(4, Types.VARCHAR);
		} else {
			pstmt.setString(4, userInfo.getLetter());
		}
		
		//����Ʈ �ΰ� ����
		if(userInfo.getDate() != null) {
			Calendar birthDay = userInfo.getDate();
			
			//date
			pstmt.setDate(5, (java.sql.Date) new Date(birthDay.getTimeInMillis()));
			
		} else {
			pstmt.setNull(5, Types.DATE);
		}
		pstmt.setString(6,  userInfo.getProfilePictureAddress());
	    pstmt.setString(7, userInfo.getId());
		
		//������ ����
		pstmt.executeUpdate();
		pstmt.close();
		
		return true;
	}
	
	//�Խñ� �ø���
	public boolean writePostPage(String comment, ArrayList<String> pictureList, ArrayList<String> hashTagList) 
		throws Exception {
		
		PreparedStatement pstmt = null;
		
		//������ ħ���� �����ϱ� ���� Ʈ����� ����
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		pstmt.close();
		//Ʈ�������� �ɾ���ұ� ������ ����ó�� ���ϸ� ����
		try  {
			//�ϴ� �Խñۺ��� �ø���
			pstmt = this.conn.prepareStatement(QueryList.MakePostPage.MAKE_POST_PAGE);
			pstmt.setString(1,  this.userInfo.getId());
			pstmt.setString(2, comment);
			pstmt.executeUpdate();
			pstmt.close();
			
			//�ø� �� �Խñ� �ε��� �������
			pstmt = this.conn.prepareStatement(QueryList.MakePostPage.GET_POST_IDX);
			ResultSet result = pstmt.executeQuery();
			
			result.next();
			int postIdx = result.getInt("@result");
			pstmt.close();
			
			//�ؽ��±׸� �ø���
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
			
			//���� ���ε�� jsp���� ó��
			
			//���� �ּҸ� ���ε�����
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
			
			//�Ϸ�
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
	
	//��� �ޱ�
	//���� �� ����
	//��� �ޱ� ����(�ε����� �؈��ϴ� �Խñ� ����) �� false ��ȯ
	public boolean writeComment(int postIdx, String comment) throws SQLException {
		
		PreparedStatement pstmt = null;
		//������� �����;� �ϹǷ� Ʈ������ ����
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		
		// ��� �ø���
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
			
			//���� �� ������
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
	
	
	//�ε����� �Խñ� ���� ã��(�ּ� ���� ����)
	//��񿡷� -> Exception
	//������ PostPage
	//���н� null
	public PostPage searchPostPageByPostIdx(int postIdx) throws Exception {
		
		PostPage resultPostPage = null; //���ϰ�
		PreparedStatement pstmt = null;
		
		//�ش� �ε����� �����ϴ� �Խñ��� �ִ� �� Ȯ��
		pstmt = this.conn.prepareStatement(QueryList.IS_POSTPAGE_EXIST);
		pstmt.setInt(1, postIdx);
		
		ResultSet rSet = pstmt.executeQuery();
		//������
		rSet.next();
		if(rSet.getInt("success") == 0)
			return null;
		rSet.close();
		pstmt.close();
		
		//����Ʈ������ ������ �̾Ƴ���
		//1.�⺻ ������ �̾Ƴ���
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_POSTPAGE_BY_IDX);
		pstmt.setInt(1, postIdx);
		
		//������ �ޱ�
		rSet = pstmt.executeQuery();
		rSet.next();
		
		String userId = rSet.getString("userId");
		String comment = rSet.getString("comment");
		Calendar writeDate = Calendar.getInstance();
		writeDate.setTime(rSet.getTimestamp("writeDate"));
		
		//Builder ����
		PostPage.Builder builder = new PostPage.Builder(postIdx, userId, comment, writeDate);
		
		rSet.close();
		pstmt.close();
		
		//�׸� �ε��� ã��
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_PICTURE_IDX_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<Integer> pictureIdxList = new ArrayList<>();
		while(rSet.next())
			pictureIdxList.add(rSet.getInt("pictureIdx"));
		rSet.close();
		pstmt.close();
		
		//�ؽ������� ã��
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_HASHTAG_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<String> hashTagList = new ArrayList<>();
		while(rSet.next())
			hashTagList.add(rSet.getString("tagName"));
		rSet.close();
		pstmt.close();
		
		//��� �ε��� ã��
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_COMMENT_IDX_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
		
		ArrayList<Integer> commentIdxList = new ArrayList<>();
		while(rSet.next())
			commentIdxList.add(rSet.getInt("idx"));
		rSet.close();
		pstmt.close();
		

		//���ƿ� ����Ʈ ã��
		pstmt = this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SERACH_FAVORITE_USER_FROM_POST);
		pstmt.setInt(1, postIdx);
		rSet = pstmt.executeQuery();
	
		ArrayList<String> favoriteList = new ArrayList<>();
		while(rSet.next())
			favoriteList.add(rSet.getString("userId"));
		rSet.close();
		pstmt.close();
		
		//�߰�
		builder.pictureList(pictureIdxList)
			.commentList(commentIdxList)
			.hashTagList(hashTagList)
			.favoriteList(favoriteList);		
		
		//�����ϰ� ����
		resultPostPage = builder.build();
		return resultPostPage;
		
	}
	//������ Picture
	//������ null ó��
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
	
	//��� ������ ã��
	//������ ������, ������ null
	public PostComment searchPostCommentDataByIdx(int commentIdx) throws Exception {
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(QueryList.SEARCH_COMMENT_DATA_BY_IDX);
		pstmt.setInt(1, commentIdx);
		ResultSet rSet = pstmt.executeQuery();
		
		if(rSet.next() == false)
			return null;
		
		// ������ ����
		int postIdx = rSet.getInt("postIdx");
		String userId = rSet.getString("userId");
		String comment = rSet.getString("comment");
		Calendar cal = Calendar.getInstance();
		cal.setTime(rSet.getTimestamp("writeDate"));
		
		PostComment postComment =
				new PostComment(commentIdx, postIdx, userId, comment, cal);
		return postComment;
	}
	
	
	//���� ������ ���� ����
	//������ �� ó��
	public User searchAboutUser(String id) throws Exception {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.HAVE_SAME_ID);
		pstmt.setString(1, id);
		ResultSet rSet = pstmt.executeQuery();
		
		rSet.next();
		int result = rSet.getInt("success");
		if( result == 0)
			return null;
		else {
			// ���� ������ ���� ����
			rSet.close();
			pstmt.close();
			pstmt = this.conn.prepareStatement("select * from User where id = ?");
			pstmt.setString(1, id);
			rSet = pstmt.executeQuery();
			
			//�������� �Ѱܾ� �����͸� ���� �� ����
			rSet.next();
			
			// User�� ����� ���� ���� ����
			User.Builder builder = new Builder(
				rSet.getString("id"), rSet.getString("pswd"),
				rSet.getString("name"), rSet.getString("phoneNumber"),
				rSet.getBoolean("isManager"), rSet.getBoolean("locked")
			);
			builder.age(rSet.getInt("age"));
			
			//����
			Gender gender = null;
			if(rSet.getString("gender").equals("male") )
				gender = Gender.Male;
			else if( rSet.getString("gender").equals("female") )
				gender = Gender.Female;
			else
				gender = Gender.Unknown;
			builder.gender(gender);
			
			//�ڱ�Ұ�
			builder.letter(rSet.getString("letter"));
			//���� �ּ�
			builder.profilePictureAddress(rSet.getString("profileAddress"));
			
			//�����ε� Date�� ���ϰ��̹Ƿ� Calendar�� ��ȯ
			Date tmpDate = rSet.getDate("birthday");
			
			
			//null���� �ƴϸ� ó��
			if(tmpDate != null) {
				Calendar cal = Calendar.getInstance();
				
				cal.setTime(tmpDate);
				builder.date(cal);
			}
			else //null���̸� null�� ����ֱ�
			{
				builder.date(null);
			}
			pstmt.close();
			rSet.close();
			
			//����!
			return builder.build();
		}
	}
	
	//�ش� ������ �ȷ����� �ٸ� ������ ���̵� ã��
	public ArrayList<String> searchFollowerUser(String followingID) throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareCall(QueryList.SEARCH_FOLLOWER_USER);
		pstmt.setString(1, followingID);
		
		//������ �������
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
	
	//유저 아이디에 대한 게시글 리스트 만들기
	public ArrayList<Integer> getPostPageIdxByUserId(String userId) throws Exception {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.GET_POST_PAGE_BY_ID);
		pstmt.setString(1, userId);
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<Integer> postIdxList = new ArrayList<>();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("postIdx"));
		rSet.close();
		pstmt.close();
	
		return postIdxList;
	}
	
	//�����ǵ�
	//�Խñ� �ε��� ����Ʈ
	public ArrayList<Integer> getNewsFeed() throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.GET_NEWSFEED);
		pstmt.setString(1, userInfo.getId());
		pstmt.setString(2, userInfo.getId());
		
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<Integer> postIdxList = new ArrayList<>();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("postIdx"));

		rSet.close();
		pstmt.close();
		return postIdxList;
		
	}
	
	//�ؽ��±׿� ���� �Խñ� �ε��� ����Ʈ �ҷ�����
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
	
	//Only edit comment
	public boolean editPostPageComment(String reComment, int postIdx) throws Exception {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.editPost.EDIT_POST_BASIC);
		pstmt.setString(1, reComment);
		pstmt.setInt(2, postIdx);
		pstmt.executeUpdate();
		
		pstmt.close();
		
		return true;
	}
		
	//update hash tag
	public boolean updateHastTagInPostPage(ArrayList<String> tagList, int postIdx) throws Exception {
		
		
		//set transaction
		PreparedStatement pstmt = this.conn.prepareStatement("start transaction");
		pstmt.executeUpdate();
		
		//delete data;
		pstmt = this.conn.prepareStatement("delete from HashTag where postIdx = ?");
		pstmt.setInt(1, postIdx);
		pstmt.executeUpdate();
		
		pstmt.close();
		
		//insert Hash Tag
		pstmt = this.conn.prepareStatement("insert into HashTag(tagName, postIdx) values(?, ?)");
		for(int i = 0; i < tagList.size(); i++) {
			pstmt.setString(1, tagList.get(i));
			pstmt.setInt(2, postIdx);
			
			pstmt.executeUpdate();
		}
		pstmt.close();
		
		pstmt = this.conn.prepareStatement("commit");
		pstmt.executeUpdate();
		
		return true;
		
		
	}
	
	public int getPicIdxFromPostPage( int postIdx) throws Exception {
		PreparedStatement pstmt = 
				this.conn.prepareStatement(QueryList.SearchPostPageByIndex.SEARCH_PICTURE_IDX_FROM_POST);
		
		pstmt.setInt(1, postIdx);
		ResultSet rSet = pstmt.executeQuery();
		
		//if false -> return -1;
		if(rSet.next() == false)
			return -1;
		else
			return rSet.getInt("pictureIdx");
	}
	
	
	//SearchHashTag without overlap
	public ArrayList<String> searchHashTagWithoutOverlap() throws Exception {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.SEARCH_HASHTAG_WITHOUT_OVERLAP);
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<String> resultTagList = new ArrayList<String>();
		
		while(rSet.next())
			resultTagList.add(rSet.getString("tagName"));
		
		return resultTagList;
	}
	
	public ArrayList<Integer> searchPostIdxByBookMark(String userId) throws Exception {
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.SEARCH_POST_IDX_BY_BOOKMARK);
		pstmt.setString(1, userId);
		ResultSet rSet = pstmt.executeQuery();
		
		ArrayList<Integer> postIdxList = new ArrayList<>();
		
		while(rSet.next())
			postIdxList.add(rSet.getInt("postIdx"));
		return postIdxList;
	}
	
	//�������� ����� ���ѿ� ���� �ٸ�
	public abstract boolean deletePostPage(int postIdx) throws Exception;
	public abstract boolean deleteComment(int cmtIdx) throws Exception;


}