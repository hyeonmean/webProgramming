package WebModule;

import java.sql.*;
import java.util.Properties;

//주의! Libraries에 jdbc가 포함되어야 합니다!
//++ tomcat의 lib위치에 jdbc jar 파일이 들어가야 구동가능합니다.

// DB 컨트롤러
// 여기서 DB 쿼리문 실행
public class DBController {
	protected Connection conn;
	protected String host;
	protected String userId;
	protected String pswd;
	protected String dataBase;
	
	// 드라이버 로딩 실패 시 Exception 호출
	public DBController(String host, String userId, String pswd, String dataBase) throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		this.host = host;
		this.userId = userId;
		this.pswd = pswd;
		this.conn = null;
		this.dataBase = dataBase;
	}
	
	//Get Set은 보안상 생성 ㄴㄴ
	
	// 디비에 연결하는 메소드
	// 연결 실패 시 Exception 호출
	public void openDataBase() throws SQLException {
		Properties props = new Properties();
		props.put("user", this.userId);
		props.put("password", this.pswd);
		
		String connStr = "jdbc:mysql://"+this.host+":3306/"+this.dataBase+"?useUnicode=true&characterEncoding=UTF-8";
		
		//연결 시도
		this.conn = DriverManager.getConnection(
			connStr, props
		);
	}
	
	//디비에 연결 해제하는 코드
	public void closeDataBase() throws NullPointerException, SQLException {
		//등록 안되면 오류처리
		if(this.conn == null)
			throw new NullPointerException("This Connection is not inited");
		//얘도 안닫히거나 이미 닫힌거면 예외처리
		this.conn.close();
	}
	
	
}