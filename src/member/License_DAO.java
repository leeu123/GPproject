package member;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import model.LicenseDTO;
import vo.DTO_AD;
import vo.ReviewBean;

public class License_DAO {

	DataSource ds;
	Connection con;
	private static License_DAO License_DAO;

	private License_DAO() {
		// TODO Auto-generated constructor stub
	}

	public static License_DAO getInstance() {
		if (License_DAO == null) {
			License_DAO = new License_DAO();
		}
		return License_DAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
//전달받은 아이디가 business테이블에 있는지 확인하기위한 작업
	public boolean isArticleBoardWriter(String id) {
            
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql = "select id from business where id=?";
		boolean isWriter = false;

		try {
			pstmt = con.prepareStatement(board_sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			if (id.equals(rs.getString("id"))) {
				isWriter = true;
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return isWriter;

	}
	
	public int insertArticle(LicenseDTO dto){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into business (id,license) values(?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getLicense());
			
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

}
