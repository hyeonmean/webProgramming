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
//�Ϲ������� ������ �� �� ����ϴ�
//�߻� Ŭ����
public abstract class LoginedDBControllerLayer extends DBController {
	
	protected User userInfo;
	
	protected LoginedDBControllerLayer(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase);
		userInfo = newUser;
	}
	
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
		pstmt.setString(6, userInfo.getId());
		
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
	
	
	//�������� ����� ���ѿ� ���� �ٸ�
	public abstract boolean deletePostPage(int postIdx) throws Exception;


}