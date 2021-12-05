package user;

// ctrl + shift + o를 누르면 알아서 자동 import가 된다.
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234";
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			System.out.println(conn);
		} catch (Exception e) {
			System.out.println("-----------------------------------------");
			System.out.println(conn);
			e.printStackTrace();
			System.out.println(conn);
		}

	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치

			}
			return -1; // 아이디 없음을 의미한는 걸로 결정
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // -2는 데이터베이스의 오류를 의미하는걸로 결정함
	}

	public int join(User user) {
		String SQL = "Insert into user values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
