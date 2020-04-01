package hoogi;

import java.sql.*;
import java.util.ArrayList;

public class HoogiDAO {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/gpteam?useSSL=false&useUnicode=true&characterEncoding=utf8";

	private final String USER_NAME = "root";
	private final String PASSWORD = "12345";

	Connection conn = null;
	Statement state = null;

	public HoogiDAO() {  // DB 들어가는 메소드
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("오류가 떴어요");
		}

	}

	public void entdb() { // DB 들어가는 메소드

		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("오류가 떴어요");

		}
	}

	public String getDate() {  //  DB에서 날짜

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
			String s = "select rpostnum from preview order by rpostnum desc"; // 제일 위에 있는 포스트넘(게시물 번호) 숫자 가져옴
			ResultSet aa = state.executeQuery(s);
			if (aa.next()) {
				return aa.getInt(1) + 1;
			}
			return 1;  // 첫번재 인 경우
		} catch (Exception e) {
		}

		return -1;
	}

	public int write(String rtitle, String nick, String rcontent) {
		try {
			state = conn.createStatement(); //
			String s = "insert into preview(rpostnum,rname,rtitle,nick,rcontent,date,available) values(" + getpNum() + ",'�떇�떦�씠由�','" + rtitle
					+ "','" + nick + "','" + rcontent + "','" + getDate() + "',1);";
			state.executeUpdate(s);
			return 0; // 입력될때
		} catch (Exception e) {
			System.out.println("이상이 있");
		}
		return -1; // 오류가 발생했을 때
	}

	public ArrayList<Hoogi> getList(int pagenumber) {
		entdb();
		ArrayList<Hoogi> hl = new ArrayList<Hoogi>();
		try {
			state = conn.createStatement(); //
			String s = "select * from preview where rpostnum < '" + (getpNum()-(pagenumber-1)*15) + "' order by rpostnum desc limit 15;";
			ResultSet aa = state.executeQuery(s);

			while (aa.next()) {
				Hoogi hoo = new Hoogi();				
				hoo.setRpostnum(aa.getInt("rpostnum"));
				hoo.setRtitle(aa.getString("rtitle"));
				hoo.setRname(aa.getString("rname"));
				hoo.setNick(aa.getString("nick"));
				hoo.setRcontent(aa.getString("rcontent"));
				hoo.setDate(aa.getString("date"));
				hoo.setAvailable(aa.getInt("available"));
				hl.add(hoo);
			}
		} catch (Exception e) {
			System.out.println("이상이 있3");
		}

		return hl;
	}
	
	
	
	public Hoogi getBoard(String postnum) {
		entdb();
		try {
			state = conn.createStatement();
			String s = "select * from preview where rpostnum = " + postnum + ";";
			ResultSet aa = state.executeQuery(s);
			Hoogi hoo = new Hoogi();
			if(aa.next()) {
				hoo.setRpostnum(aa.getInt("rpostnum"));
				hoo.setRtitle(aa.getString("rtitle"));
				hoo.setRname(aa.getString("rname"));
				hoo.setNick(aa.getString("nick"));
				hoo.setRcontent(aa.getString("rcontent"));
				hoo.setDate(aa.getString("date"));
			}
			return hoo;
		} catch (Exception e) {
			System.out.println("이상이 있14124");
		}
		return null;
	}

	public boolean nextPage(int pagenumber) {
		try {
			state = conn.createStatement(); //
			String s = "select * from preview where rpostnum < '" + getpNum() + "' order by rpostnum desc limit "
					+ (getpNum() - (pagenumber - 1) * 10) + ";";
			ResultSet aa = state.executeQuery(s);
			if (aa.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("이상이 있2");
		}

		return false;
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
