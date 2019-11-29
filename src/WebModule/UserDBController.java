package WebModule;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import WebModule.*;

//일반 유저용 DB 컨트롤러

@SuppressWarnings("unused")
//일반 유저용 DB 컨트롤러

public class UserDBController extends LoginedDBControllerLayer {
	public UserDBController(String host, String userId, String pswd, String dataBase, User newUser) 
			throws Exception {
		super(host, userId, pswd, dataBase, newUser);
	}
	
	
	//게시물 삭제
	//성공시 true
	//에러 Exception
	//실패 FALSE
	public boolean deletePostPage(int postIdx) throws SQLException {
		PreparedStatement pstmt = null;
		
		//이 인덱스가 해당 유저의 인덱스가 맞는 지 검사
		pstmt = this.conn.prepareStatement("select * from PostPage where postIdx = ? and userId = ?");
		pstmt.setInt(1, postIdx);
		pstmt.setString(2,  userInfo.getId());
		ResultSet pr = pstmt.executeQuery();
		
		//맞지 않는 경우
		if(pr.next() == false) {
			return false;
		}
		pr.close();
		pstmt.close();
		
		//결과 값을 갖고와야 하기 때문에 트랜젝션 설정
		pstmt = this.conn.prepareStatement(QueryList.START_TRANSACTION);
		pstmt.executeUpdate();
		
		try {
			pstmt = this.conn.prepareStatement(QueryList.DELETE_POST_PAGE);
		
			//게시물 삭제
			pstmt.setInt(1, postIdx);
			pstmt.executeUpdate();
		
			pstmt.close();
		
			//결과 확인
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
	
	//댓글 삭제
	//파라미터: 코멘트 인덱스
	public boolean deleteComment(int cmtIdx) throws Exception {
		PreparedStatement pstmt = null;
		
		//댓글이 자기가 만든 건 지를 검사
		pstmt = this.conn.prepareStatement("select * from PostComment where userId = ? and idx = ?");
		pstmt.setString(1,userInfo.getId());
		pstmt.setInt(2, cmtIdx);
		
		ResultSet rSet = pstmt.executeQuery();
		
		// 권한이 아니거나 존재하지 않음
		if( rSet.next() == false)
		{
			
			rSet.close();
			pstmt.close();
			return false;
		}
		pstmt.close();
		//코멘트 삭제
		pstmt = this.conn.prepareStatement(QueryList.DELETE_COMMENT);
		pstmt.setInt(1,  cmtIdx);
		pstmt.executeUpdate();
		
		pstmt.close();
		
		return true;
	}
}