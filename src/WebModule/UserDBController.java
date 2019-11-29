package WebModule;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import WebModule.*;

//�Ϲ� ������ DB ��Ʈ�ѷ�

@SuppressWarnings("unused")
public class UserDBController extends LoginedDBControllerLayer {
	public UserDBController(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase, newUser);
	}
	
	
	//�Խù� ����
	//������ true
	//���� Exception
	//���� FALSE
	//TODO �� �ȵ�
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
	/*
	public boolean deleteComment(int commentIdx) {
		PreparedStatement pstmt = null;
		
		
		return true;
	}
	*/
}