package WebModule;

import java.sql.*;
import java.util.Properties;

//����! Libraries�� jdbc�� ���ԵǾ�� �մϴ�!
//++ tomcat�� lib��ġ�� jdbc jar ������ ���� ���������մϴ�.

// DB ��Ʈ�ѷ�
// ���⼭ DB ������ ����
public class DBController {
	protected Connection conn;
	protected String host;
	protected String userId;
	protected String pswd;
	protected String dataBase;
	
	// ����̹� �ε� ���� �� Exception ȣ��
	public DBController(String host, String userId, String pswd, String dataBase) throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		this.host = host;
		this.userId = userId;
		this.pswd = pswd;
		this.conn = null;
		this.dataBase = dataBase;
	}
	
	//Get Set�� ���Ȼ� ���� ����
	
	// ��� �����ϴ� �޼ҵ�
	// ���� ���� �� Exception ȣ��
	public void openDataBase() throws SQLException {
		Properties props = new Properties();
		props.put("user", this.userId);
		props.put("password", this.pswd);
		
		String connStr = "jdbc:mysql://"+this.host+":3306/"+this.dataBase+"?useUnicode=true&characterEncoding=UTF-8";
		
		//���� �õ�
		this.conn = DriverManager.getConnection(
			connStr, props
		);
	}
	
	//��� ���� �����ϴ� �ڵ�
	public void closeDataBase() throws NullPointerException, SQLException {
		//��� �ȵǸ� ����ó��
		if(this.conn == null)
			throw new NullPointerException("This Connection is not inited");
		//�굵 �ȴ����ų� �̹� �����Ÿ� ����ó��
		this.conn.close();
	}
	
	
}