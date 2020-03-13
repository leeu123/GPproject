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

	public HoogiDAO() {  // DB �뱾�뼱媛��뒗 硫붿냼�뱶
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("�삤瑜섍� �뼱�뼱�슂");
		}

	}

	public void entdb() { // DB �뱾�뼱媛��뒗 硫붿냼�뱶

		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("�삤瑜섍� �뼱�뼱�슂");

		}
	}

	public String getDate() {  // DB�뿉�꽌 �궇吏� 

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
			String s = "select rpostnum from preview order by rpostnum desc"; // �젣�씪 �쐞�뿉 �엳�뒗 �룷�뒪�듃�꽆(寃뚯떆臾� 踰덊샇) �닽�옄 媛��졇�샂
			ResultSet aa = state.executeQuery(s);
			if (aa.next()) {
				return aa.getInt(1) + 1;
			}
			return 1; // 泥ル쾲�옱 �씤 寃쎌슦
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
			return 0; // �엯�젰�맆�븣
		} catch (Exception e) {
			System.out.println("�씠�긽�씠 �엳");
		}
		return -1; // �삤瑜섍� 諛쒖깮�뻽�쓣 �븣
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
			System.out.println("�씠�긽�씠 �엳3");
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
			System.out.println("�씠�긽�씠 �엳14124");
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
			System.out.println("�씠�긽�씠 �엳2");
		}

		return false;
	}

	public void clodb() {
		if (state != null) {
			try {
				state.close();
			} catch (Exception e) {
				System.out.println("state �뙆�씪�뿉 �씠�긽�씠 �엳�뒿�땲�떎.");
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("conn �뙆�씪 �떕湲� �씠�긽�씠 �엳�뒿�땲�떎.");
			}

		}
	}

}
