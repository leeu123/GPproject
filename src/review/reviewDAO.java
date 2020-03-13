package review;

import java.sql.*;
import java.util.ArrayList;

import review.reviewDTO;

public class reviewDAO {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/gpteam?useSSL=false&useUnicode=true&characterEncoding=utf8";

	private final String USER_NAME = "root";
	private final String PASSWORD = "12345";

	Connection conn = null;
	Statement state = null;

	public reviewDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("오류가 떴어요");
		}

	}

	public void entdb() {

		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("오류가 떴어요");

		}
	}

	public String getDate() {

		String in = null;

		try {
			state = conn.createStatement(); //
			String s = "select now()";
			ResultSet aa = state.executeQuery(s);
			if (aa.next()) {
				return aa.getString(1);
			}
		} catch (Exception e) {
		}

		return in;
	}

	public int getpNum() {

		try {
			state = conn.createStatement(); //
			String s = "select postnum from resdat order by postnum desc"; // 제일 위에 있는 포스트넘(게시물 번호) 숫자 가져옴
			ResultSet aa = state.executeQuery(s);
			if (aa.next()) {
				return aa.getInt(1) + 1;
			}
			return 1; // 첫번재 인 경우
		} catch (Exception e) {
		}

		return -1;
	}

	public int write(String pyung, String nick, String content) {
		try {
			state = conn.createStatement(); //
			String s = "insert into resdat(dnum,nick,pyung,dcontent,date) values('" + getpNum() + "','" + nick + "','" + pyung + "','"
					+ content + "','" + getDate() + "');";
			state.executeUpdate(s);
			return 0; // 입력될때
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1; // 오류가 발생했을 때
	}
	
	
	public ArrayList<reviewDTO> getList() {
		entdb();
		ArrayList<reviewDTO> hl = new ArrayList<reviewDTO>();
		try {
			state = conn.createStatement(); //
			String s = "select * from resdat where postnum < '" + getpNum() + "' order by postnum desc limit 19;";
			ResultSet aa = state.executeQuery(s);

			while (aa.next()) {
				reviewDTO rdto = new reviewDTO();
				rdto.setPostnum(aa.getInt("postnum"));
				rdto.setNick(aa.getString("nick"));
				rdto.setPyung(aa.getString("pyung"));
				rdto.setContent(aa.getString("content"));
				rdto.setDate(aa.getString("date"));
				hl.add(rdto);
			}
		} catch (Exception e) {
			System.out.println("이상이 있3");
		}

		return hl;
	}
	
	public ArrayList<reviewDTO> getListP(String pyung) {
		entdb();
		ArrayList<reviewDTO> hl = new ArrayList<reviewDTO>();
		try {
			state = conn.createStatement(); //
			String s = "select * from resdat where postnum < '" + getpNum() +"' and pyung = '"+pyung+ "' order by postnum desc limit 18;";
			ResultSet aa = state.executeQuery(s);

			while (aa.next()) {
				reviewDTO rdto = new reviewDTO();
				rdto.setPostnum(aa.getInt("postnum"));
				rdto.setNick(aa.getString("nick"));
				rdto.setPyung(aa.getString("pyung"));
				rdto.setContent(aa.getString("content"));
				rdto.setDate(aa.getString("date"));
				hl.add(rdto);
			}
		} catch (Exception e) {
			System.out.println("이상이 있3");
		}

		return hl;
	}

	public void clodb() {
		if (state != null) {
			try {
				state.close();
			} catch (Exception e) {
				System.out.println("state 파일에 이상이 있습니다.");
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("conn 파일 닫기 이상이 있습니다.");
			}

		}
	}

}
