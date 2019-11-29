package WebModule;

public class QueryList {
	//로그인
	public static String SIGN_IN = "select exists "
			+ "(select * from User where id = ? and pswd = ?) as success";
	
	//회원 가입 하기 전에 똑같은 아이디가 있는 지 확인
	public static String HAVE_SAME_ID = "select exists "
			+ "(select * from User where id = ?) as success";
	
	//게시글이 존재하는 지 확인
	public static String IS_POSTPAGE_EXIST = "select exists "
			+ "(select * from PostPage where postIdx = ?) as success";
	
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
	
	//댓글 삭제
	public static String DELETE_COMMENT = "call delete_comment(?, @result)";
	
	public static class SearchPostPageByIndex {
		//picture index로 게시물관련 데이터 찾기
		
		//게시글 기본 데이터 찾기
		public static String SEARCH_POSTPAGE_BY_IDX = "select * from PostPage where postIdx = ?";
		
		//게시글 인덱스로 해쉬데이터 찾기
		public static String SEARCH_HASHTAG_FROM_POST = "select tagName from HashTag where postIdx = ?";
		
		//게시글 인덱스로 댓글 찾기
		public static String SEARCH_COMMENT_IDX_FROM_POST = "select idx from PostComment where postIdx = ?";
		
		//게시글 인덱스로 그림 찾기
		public static String SEARCH_PICTURE_IDX_FROM_POST = "select pictureIdx from Picture where postIdx = ?";
		
		//게시글 인덱스로 좋아요 리스트 찾기
		public static String SERACH_FAVORITE_USER_FROM_POST = 
				"select userId from Picture where postIdx = ?";
	}
	
	//그림 및 댓글 데이터 찾기
	public static String SEARCH_PICTURE_DATA_BY_IDX = "select * from Picture where pictureIdx = ?";
	public static String SEARCH_COMMENT_DATA_BY_IDX = "select * from PostComment where idx = ?";
	
	//해당 유저에 대한 모든 정보 찾기
	public static String SEARCH_ABOUT_USER = "select * from User where id = ?";
	
	//해당 유저가 팔로잉한 다른 유저의 아이디 찾기
	public static String SEARCH_FOLLOWER_USER = "select followerID from Follow where followingID = ?";
	
	//해당 유저가 팔로잉 된 다른 유저의 아이디 찾기
	public static String SEARCH_FOLLOWING_USER = "select followingID from Follow where followerID = ?";
	
	//뉴스피드 -> 게시글 인덱스만
	public static String GET_NEWSFEED = "select postIdx from PostPage where userId in "
			+ "( select followingID from Follow where followerID = ?) "
			+ "order by writeDate desc limit 10";
	
	//유저 삭제
	public static String DELETE_USER = "call delete_user(?, @result)";

}