package review_svc;

import java.sql.Connection;
import review_dao.ReviewDAO;
import vo.ReviewBean;
import static db.JdbcUtil.*;
public class ReviewWriteProService {

	public boolean registArticle(ReviewBean boardBean) throws Exception{
         System.out.println("1."+boardBean.getLocation());
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int insertCount = reviewDAO.insertArticle(boardBean);
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
