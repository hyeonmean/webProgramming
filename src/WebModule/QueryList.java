package WebModule;

public class QueryList {
	//�α���
	public static String SIGN_IN = "select exists "
			+ "(select * from User where id = ? and pswd = ?) as success";
	
	//ȸ�� ���� �ϱ� ���� �Ȱ��� ���̵� �ִ� �� Ȯ��
	public static String HAVE_SAME_ID = "select exists "
			+ "(select * from User where id = ?) as success";
	
	//�Խñ��� �����ϴ� �� Ȯ��
	public static String IS_POSTPAGE_EXIST = "select exists "
			+ "(select * from PostPage where postIdx = ?) as success";
	
	public static String GET_POST_PAGE_BY_ID = "select * from PostPage where userId = ?";
	
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
	
	//���ƿ�
	//1 -> �Խñ� �ε���
	//2 -> �������̵�
	public static String FAVORITE = "insert into Favorite(postIdx, userId, favoriteDate) "
			+ "values(?, ? , date_format(now(), '%Y-%m-%d %H:%i:%s'))";
	
	//�����ƿ�
	//1 -> �Խñ� �ε���
	//2 -> �������̵�
	public static String UNFAVORITE = "delete from Favorite where postIdx = ? and userId = ?";
	
	//�ȷο�, ���ȷο�
	public static String FOLLOW = "insert into Follow(followerID, followingID) values (?,?)";
	public static String UNFOLLOW = "delete from Follow where followerID = ? and followingID = ?";
	
	//�ϸ�ũ ����/����
	//�Խñ� �ε���, �������̵�
	public static String SET_BOOKMARK = "insert into BookMark(postIdx, userId) values(?,?)";
	public static String UNSET_BOOKMARK = "delete from BookMark where postIdx = ? and userId = ?";
	
	//������ ����
	public static String EDIT_PROFILE = "update User "
			+ "set name = ?, "
			+ "phoneNumber = ?, "
			+ "gender = ?, "
			+ "letter = ?, "
			+ "birthday = ?, "
			+ "profileAddress=? "
			+ "where id = ?";
	
	//Ʈ������ ���� ������
	public static String START_TRANSACTION = "start transaction";
	public static String ROLLBACK = "rollback";
	public static String COMMIT = "commit";
	
	//�Ϻ� ���ν����� ���� ����� ����
	public static String GET_RESULT = "select @result";
	
	// �Խñ� ���� ������
	// ��� �������� ����ؾ� �ϱ� ������
	// Ŭ������ ����
	public static class MakePostPage {
		public static String MAKE_POST_PAGE = "call make_PostPage(?,?,@result)";
		public static String GET_POST_IDX = "select @result";
		
		//그림 업로드
		public static String UPLOAD_PICTURE = "call insert_picture(?,?,@result)";
		
		//해시태그 업로드
		public static String UPLOAD_HASHTAG = "insert into HashTag(tagName, postIdx) values(?,?)";
	}
	//�Խù� ����
	public static String DELETE_POST_PAGE = "call delete_PostPage(?, @result)";
	
	//��� ����
	public static String WRITE_COMMENT="call insert_comment(?, ?, ?, @result)";
	
	//��� ����
	public static String DELETE_COMMENT = "call delete_comment(?, @result)";
	
	public static class SearchPostPageByIndex {
		//picture index�� �Խù����� ������ ã��
		
		//�Խñ� �⺻ ������ ã��
		public static String SEARCH_POSTPAGE_BY_IDX = "select * from PostPage where postIdx = ?";
		
		//�Խñ� �ε����� �ؽ������� ã��
		public static String SEARCH_HASHTAG_FROM_POST = "select tagName from HashTag where postIdx = ?";
		
		//�Խñ� �ε����� ��� ã��
		public static String SEARCH_COMMENT_IDX_FROM_POST = "select idx from PostComment where postIdx = ?";
		
		//�Խñ� �ε����� �׸� ã��
		public static String SEARCH_PICTURE_IDX_FROM_POST = "select pictureIdx from Picture where postIdx = ?";
		
		//�Խñ� �ε����� ���ƿ� ����Ʈ ã��
		public static String SERACH_FAVORITE_USER_FROM_POST = "select userId from Favorite where postIdx = ?";
	}
	
	//�׸� �� ��� ������ ã��
	public static String SEARCH_PICTURE_DATA_BY_IDX = "select * from Picture where pictureIdx = ?";
	public static String SEARCH_COMMENT_DATA_BY_IDX = "select * from PostComment where idx = ?";
	
	//�ش� ������ ���� ��� ���� ã��
	public static String SEARCH_ABOUT_USER = "select * from User where id = ?";
	
	//�ش� ������ �ȷ����� �ٸ� ������ ���̵� ã��
	public static String SEARCH_FOLLOWER_USER = "select followerID from Follow where followingID = ?";
	
	//�ش� ������ �ȷ��� �� �ٸ� ������ ���̵� ã��
	public static String SEARCH_FOLLOWING_USER = "select followingID from Follow where followerID = ?";
	
	//�����ǵ� -> �Խñ� �ε�����
	public static String GET_NEWSFEED = "select postIdx from PostPage where userId in "
			+ "( select followingID from Follow where followerID = ?) "
			+ "order by writeDate desc limit 10";
	
	//���� ����
	public static String DELETE_USER = "call delete_user(?, @result)";
	
	//�ؽ��±׿� ���Ե� �Խñ� �ҷ�����
	public static String GET_POST_BY_HASHTAG = "select pp.postIdx from PostPage as pp " + 
			"join HashTag as ht on ht.tagName = ? " + 
			"where ht.postIdx = pp.postIdx";
	
	//게시글 작성
	static public class editPost {
		public static String EDIT_POST_BASIC = "update PostPage "
				+ "set comment = ? where pstIdx = ?";
		public static String DELETE_IMG_IN_POST_PAGE = "call delete_picture(?, @result)";
		public static String DELETE_HASH_TAG = "delete from HashTag where postIdx = ? and tagName = ?";
	}
	
	
	//search hash tag by one
	public static String SEARCH_HASHTAG_WITHOUT_OVERLAP="select tagName from HashTag group by tagName";

}