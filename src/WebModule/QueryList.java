package WebModule;

public class QueryList {
	//로그인
	public static String SIGN_IN = "select exists "
			+ "(select * from User where id = ? and pswd = ?) as success";
	
	//회원 가입 하기 전에 똑같은 아이디가 있는 지 확인
	public static String HAVE_SAME_ID = "select exists "
			+ "(select * from User where id = ?) as success";
	
	public static String SIGN_UP = "insert into User("
			+ "id,"
			+ "pswd,"
			+ "name,"
			+ "phoneNumber,"
			+ "age,"
			+ "gender,"
			+ "letter,"
			+ "profileAddress,"
			+ "birthday,"
			+ "locked,"
			+ "isManager"
			+ ") values ("
			+ "?,?,?,?,?,?,?,?,?,?,?)";
	
	//좋아요
	//1 -> 게시글 인덱스
	//2 -> 유저아이디
	public static String FAVORITE = "insert into Favorite(postIdx, userId, favoriteDate) "
			+ "values(?, ? , date_format(now(), '%Y-%m-%d %H:%i:%s'))";
	
	//안좋아요
	//1 -> 게시글 인덱스
	//2 -> 유저아이디
	public static String UNFAVORITE = "delete from Favorite where postIdx = ? and userId = ?";
	
	//팔로우, 언팔로우
	public static String FOLLOW = "insert into Follow(followerID, followingID) values (?,?)";
	public static String UNFOLLOW = "delete from Follow where followerID = ? and followingID = ?";
	
	//북마크 설정/해제
	//게시글 인덱스, 유저아이디
	public static String SET_BOOKMARK = "insert into BookMark(postIdx, userId) values(?,?)";
	public static String UNSET_BOOKMARK = "delete from BookMark where postIdx = ? and userId = ?";
	
	//프로필 수정
	public static String EDIT_PROFILE = "update User "
			+ "set name = ?, "
			+ "phoneNumber = ?, "
			+ "gender = ?, "
			+ "letter = ?, "
			+ "birthday = ? "
			+ "where id = ?";
	
	//트랜젝션 설정 쿼리문
	public static String START_TRANSACTION = "start transaction";
	public static String ROLLBACK = "rollback";
	public static String COMMIT = "commit";
	
	//일부 프로시저에 대한 결과값 보기
	public static String GET_RESULT = "select @result";
	
	// 게시글 삽입 쿼리문
	// 얘는 여러개를 사용해야 하기 때문에
	// 클래스로 묶음
	public static class MakePostPage {
		public static String MAKE_POST_PAGE = "call make_PostPage(?,?,@result)";
		public static String GET_POST_IDX = "select @result";
		public static String UPLOAD_PICTURE = "call insert_picture(?,?,@result)";
		public static String UPLOAD_HASHTAG = "insert into HashTag(tagName, postIdx) values(?,?)";
	}
	//게시물 삭제
	public static String DELETE_POST_PAGE = "call delete_PostPage(?, @result)";
	
	//댓글 쓰기
	public static String WRITE_COMMENT="call insert_comment(?, ?, ?, @result)";

}