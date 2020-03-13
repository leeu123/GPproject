package member;

import static db.JdbcUtil.*;
import java.sql.Connection;
import member.License_DAO;
import model.LicenseDTO;
import review_dao.ReviewDAO;
import vo.ReviewBean;

public class License_service {
//사업자 테이블에 전달받은 아이디가 있는지 확인하기위해 License_DAO페이지로 보내주는 페이지
	public boolean isArticleWriter(String id) throws Exception {
		boolean isArticleWriter = false;
		Connection con = getConnection();
		License_DAO reviewDAO = License_DAO.getInstance();
		reviewDAO.setConnection(con);
		isArticleWriter = reviewDAO.isArticleBoardWriter(id);
		close(con);
		return isArticleWriter;

	}
	
	public boolean insert(LicenseDTO dto) throws Exception{
        
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		License_DAO licenseDAO = License_DAO.getInstance();
	    licenseDAO.setConnection(con);
		int insertCount = licenseDAO.insertArticle(dto);
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
