package WebModule;

import WebModule.*;
import WebModule.User.Builder;

import java.sql.*;
import java.util.Calendar;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

// �α��� ���� ���� ���¿��� ��������
// �����ϴ� Ŭ����
// ���� ��� ȸ�������̳�, �α����� �ִ�.
@SuppressWarnings("unused")
public class UnLoginedDBController extends DBController {
	
	// ������
	public UnLoginedDBController(String host, String userId, String pswd, String dataBase) 
			throws Exception {
		super(host, userId, pswd, dataBase);
	}
	
	// �α����ϱ�
	// ���� ��, �ش� ������ ����
	// ���� �� null �Ǵ� SQLException
	public User signIn(String id, String pswd) throws SQLException {
		
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.SIGN_IN);
		pstmt.setString(1, id);
		pstmt.setString(2, pswd);
		ResultSet rSet = pstmt.executeQuery();
		
		rSet.next();
		int result = rSet.getInt("success");
		if( result == 0)
			return null;
		else {
			// ���� ������ ���� ����
			rSet.close();
			pstmt.close();
			pstmt = this.conn.prepareStatement("select * from User where id = ?");
			pstmt.setString(1, id);
			rSet = pstmt.executeQuery();
			
			//�������� �Ѱܾ� �����͸� ���� �� ����
			rSet.next();
			
			// User�� ����� ���� ���� ����
			User.Builder builder = new Builder(
				rSet.getString("id"), rSet.getString("pswd"),
				rSet.getString("name"), rSet.getString("phoneNumber"),
				rSet.getBoolean("isManager"), rSet.getBoolean("locked")
			);
			builder.age(rSet.getInt("age"));
			
			//����
			Gender gender = null;
			if(rSet.getString("gender").equals("male") )
				gender = Gender.Male;
			else if( rSet.getString("gender").equals("female") )
				gender = Gender.Female;
			else
				gender = Gender.Unknown;
			builder.gender(gender);
			
			//�ڱ�Ұ�
			builder.letter(rSet.getString("letter"));
			//���� �ּ�
			builder.profilePictureAddress(rSet.getString("profileAddress"));
			
			//�����ε� Date�� ���ϰ��̹Ƿ� Calendar�� ��ȯ
			Date tmpDate = rSet.getDate("birthday");
			
			
			//null���� �ƴϸ� ó��
			if(tmpDate != null) {
				Calendar cal = Calendar.getInstance();
				
				cal.setTime(tmpDate);
				builder.date(cal);
			}
			else //null���̸� null�� ����ֱ�
			{
				builder.date(null);
			}
			pstmt.close();
			rSet.close();
			
			//����!
			return builder.build();
		}
	}
	
	// ȸ�� ����
	public boolean signUp(User newUser) throws SQLException, NullPointerException {
		
		//���� ������ �̸��� �ִ� �� Ȯ��
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.HAVE_SAME_ID);
		pstmt.setString(1, newUser.getId());
		ResultSet rSet = pstmt.executeQuery();
		
		rSet.next();
		int result = rSet.getInt("success");
		if( result != 0)
			return false;
		
		// ���� ��� ����
		pstmt = this.conn.prepareStatement(QueryList.SIGN_UP);
		
		// �ʼ� �Է� ���� -> null �ϳ��� ������ NullPointException �߻�
		pstmt.setString(1, newUser.getId());
		pstmt.setString(2, newUser.getPswd());
		pstmt.setString(3, newUser.getName());
		pstmt.setString(4, newUser.getPhoneNumber());
		
		//���⼭���� ���û���
		Integer age = newUser.getAge();
		if(age != 0)
			pstmt.setInt(5, newUser.getAge());
		else
			pstmt.setNull(5, Types.INTEGER);
		
		
		if(newUser.getGender() != null)
			pstmt.setInt(6, newUser.getGender().getTable2value());
		else
			pstmt.setNull(6, Types.BOOLEAN);
		
		if(newUser.getLetter() != null)
			pstmt.setString(7, newUser.getLetter());
		else
			pstmt.setNull(7, Types.VARCHAR);
		
		if(newUser.getProfilePictureAddress() != null)
			pstmt.setString(8, newUser.getProfilePictureAddress());
		else
			pstmt.setNull(8, Types.VARCHAR);
		
		//������ ������ ���
		if(newUser.getDate() != null) {
			Calendar birthDay = newUser.getDate();
			int year = birthDay.get(Calendar.YEAR);
			int month = birthDay.get((Calendar.MONTH))+1; //1���� 0���� �Ǿ� ����
			int date = birthDay.get(Calendar.DAY_OF_MONTH);
			String birthFormat = String.valueOf(year)+
					"-"+
					String.valueOf(month)+
					"-"+
					String.valueOf(date);
			pstmt.setString(9, birthFormat);
		}
		else
			pstmt.setNull(9, Types.DATE);
		pstmt.setBoolean(10, newUser.getLocked());
		pstmt.setBoolean(11, newUser.getIsManager());
		
		pstmt.executeUpdate();
		return true;
	}

}