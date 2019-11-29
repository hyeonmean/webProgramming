package WebModule;

public class QueryList {
	//�α���
	public static String SIGN_IN = "select exists "
			+ "(select * from User where id = ? and pswd = ?) as success";
	
	//ȸ�� ���� �ϱ� ���� �Ȱ��� ���̵� �ִ� �� Ȯ��
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
			+ "birthday = ? "
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
		public static String UPLOAD_PICTURE = "call insert_picture(?,?,@result)";
		public static String UPLOAD_HASHTAG = "insert into HashTag(tagName, postIdx) values(?,?)";
	}
	//�Խù� ����
	public static String DELETE_POST_PAGE = "call delete_PostPage(?, @result)";
	
	//��� ����
	public static String WRITE_COMMENT="call insert_comment(?, ?, ?, @result)";

}