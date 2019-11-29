package WebModule;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import WebModule.*;

//�Ϲ� ������ DB ��Ʈ�ѷ�

@SuppressWarnings("unused")
//�Ϲ� ������ DB ��Ʈ�ѷ�

public class UserDBController extends LoginedDBControllerLayer {
	public UserDBController(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase, newUser);
	}
	
	
	//�Խù� ����
	//������ true
	//���� Exception
	//���� FALSE
	public boolean deletePostPage(int postIdx) throws SQLException {
		PreparedStatement pstmt = null;
		
		//�� �ε����� �ش� ������ �ε����� �´� �� �˻�
		pstmt = this.conn.prepareStatement("select * from PostPage where postIdx = ? and userId = ?");
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  userInfo.getId());
		ResultSet pr = pstmt.executeQuery();
		
		//���� �ʴ� ���
		if(pr.next() == false) {
			return false;
		}
		pr.close();
		pstmt.close();
		
		//��� ���� ����;� �ϱ� ������ Ʈ������ ����
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		
		try {
			pstmt = this.conn.prepareStatement(QueryList.DELETE_POST_PAGE);
		
			//�Խù� ����
			pstmt.setInt(1, postIdx);
			pstmt.executeUpdate();
		
			pstmt.close();
		
			//��� Ȯ��
			pstmt = this.conn.prepareStatement(QueryList.GET_RESULT);
			ResultSet rSet = pstmt.executeQuery();
			rSet.next();

			int result = rSet.getInt("@result");
			
			pstmt.close();
			rSet.close();
			
			pstmt = this.conn.prepareStatement(QueryList.COMMIT);
			pstmt.executeUpdate();
			
			if(result == -1) return false;
			return true;
			
			
		} catch(Exception e) {
			pstmt = this.conn.prepareStatement(QueryList.ROLLBACK);
			pstmt.executeUpdate();
			throw e;
		}
	}
	
	//��� ����
	//�Ķ����: �ڸ�Ʈ �ε���
	public boolean deleteComment(int cmtIdx) throws Exception {
		PreparedStatement pstmt = null;
		
		//����� �ڱⰡ ���� �� ���� �˻�
		pstmt = this.conn.prepareStatement("select * from PostComment where userId = ? and idx = ?");
		pstmt.setString(1,userInfo.getId());
		pstmt.setInt(2, cmtIdx);
		
		ResultSet rSet = pstmt.executeQuery();
		
		// ������ �ƴϰų� �������� ����
		if( rSet.next() == false)
		{
			
			rSet.close();
			pstmt.close();
			return false;
		}
		pstmt.close();
		//�ڸ�Ʈ ����
		pstmt = this.conn.prepareStatement(QueryList.DELETE_COMMENT);
		pstmt.setInt(1,  cmtIdx);
		pstmt.executeUpdate();
		
		pstmt.close();
		
		return true;
	}
}