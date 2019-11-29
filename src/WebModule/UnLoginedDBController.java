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

// 로그인 하지 않은 상태에서 쿼리문을
// 수행하는 클래스
// 예를 들어 회원가입이나, 로그인이 있다.
@SuppressWarnings("unused")
public class UnLoginedDBController extends DBController {
	
	// 생성자
	public UnLoginedDBController(String host, String userId, String pswd, String dataBase) 
			throws Exception {
		super(host, userId, pswd, dataBase);
	}
	
	// 로그인하기
	// 성공 시, 해당 유저의 정보
	// 실패 시 null 또는 SQLException
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
			// 유저 데이터 갖고 오기
			rSet.close();
			pstmt.close();
			pstmt = this.conn.prepareStatement("select * from User where id = ?");
			pstmt.setString(1, id);
			rSet = pstmt.executeQuery();
			
			//다음으로 넘겨야 데이터를 받을 수 있음
			rSet.next();
			
			// User를 만들기 위한 빌더 생성
			User.Builder builder = new Builder(
				rSet.getString("id"), rSet.getString("pswd"),
				rSet.getString("name"), rSet.getString("phoneNumber"),
				rSet.getBoolean("isManager"), rSet.getBoolean("locked")
			);
			builder.age(rSet.getInt("age"));
			
			//나이
			Gender gender = null;
			if(rSet.getString("gender").equals("male") )
				gender = Gender.Male;
			else if( rSet.getString("gender").equals("female") )
				gender = Gender.Female;
			else
				gender = Gender.Unknown;
			builder.gender(gender);
			
			//자기소개
			builder.letter(rSet.getString("letter"));
			//사진 주소
			builder.profilePictureAddress(rSet.getString("profileAddress"));
			
			//생일인데 Date가 리턴값이므로 Calendar로 전환
			Date tmpDate = rSet.getDate("birthday");
			
			
			//null값이 아니면 처리
			if(tmpDate != null) {
				Calendar cal = Calendar.getInstance();
				
				cal.setTime(tmpDate);
				builder.date(cal);
			}
			else //null값이면 null값 집어넣기
			{
				builder.date(null);
			}
			pstmt.close();
			rSet.close();
			
			//빌드!
			return builder.build();
		}
	}
	
	// 회원 가입
	public boolean signUp(User newUser) throws SQLException, NullPointerException {
		
		//같은 유저의 이름이 있는 지 확인
		PreparedStatement pstmt = this.conn.prepareStatement(QueryList.HAVE_SAME_ID);
		pstmt.setString(1, newUser.getId());
		ResultSet rSet = pstmt.executeQuery();
		
		rSet.next();
		int result = rSet.getInt("success");
		if( result != 0)
			return false;
		
		// 유저 등록 시작
		pstmt = this.conn.prepareStatement(QueryList.SIGN_UP);
		
		// 필수 입력 사항 -> null 하나라도 있으면 NullPointException 발생
		pstmt.setString(1, newUser.getId());
		pstmt.setString(2, newUser.getPswd());
		pstmt.setString(3, newUser.getName());
		pstmt.setString(4, newUser.getPhoneNumber());
		
		//여기서부터 선택사항
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
		
		//생일을 기재한 경우
		if(newUser.getDate() != null) {
			Calendar birthDay = newUser.getDate();
			int year = birthDay.get(Calendar.YEAR);
			int month = birthDay.get((Calendar.MONTH))+1; //1월이 0으로 되어 있음
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