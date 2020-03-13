package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MemberDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost/gpteam?useSSL=false&useUnicode=true&characterEncoding=utf8"; //한글 깨짐 방지
			String dbID = "root";
			String dbPassword = "12345";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//---------------------------------?로그인?---------------------------------------------------------------
	
	public int login(String id, String pw) {
		String SQL = "SELECT pw FROM membership where id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id); 
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 if(rs.getString(1).equals(pw)) {
					
				
					 return 1;
				 }
				 else {
					 return 0; 
				 }
			 }
			 return -1;  
			}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
//========================================================================================================================================
	public String selectNick(String id) {
		String s = "false";
		String SQL = "SELECT id,nick FROM membership where id = ?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id); 
			 rs = pstmt.executeQuery();	
			 if(rs.next()) {
				return rs.getString(2);
			 } 
			}catch (Exception e) {
			e.printStackTrace();
		}
		return s;
		 
	}
//--------------------------회원가입------------------------------------------------------------------------	
	public int join(MemberDTO user) {
		String SQL = "insert into membership (id,nick,pw,pwhint,pwa,name,age,sex,email,home,dethome,cell,postnum) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getNick());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getPwhint());
			pstmt.setString(5, user.getPwa());
			pstmt.setString(6, user.getName());
			pstmt.setString(7, user.getAge());
			pstmt.setString(8, user.getSex());
			pstmt.setString(9, user.getEmail());
			pstmt.setString(10, user.getHome());
			pstmt.setString(11, user.getDethome());
			pstmt.setString(12, user.getCell());
			pstmt.setString(13, user.getPostnum());
			
			
			
				int i=pstmt.executeUpdate(); //정상적으로 실행이 되면 1의값이 남는다.
				return i;
			}catch (Exception e) {
			System.out.println(e);
		}
		return -1; 
	}
	
	
}
