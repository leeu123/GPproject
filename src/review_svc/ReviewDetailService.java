package review_svc;

import java.sql.Connection;
import review_dao.ReviewDAO;
import vo.ReviewBean;
import static db.JdbcUtil.*;

public class ReviewDetailService {

	public ReviewBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("2¹ø"+board_num);
		ReviewBean article = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int updateCount = reviewDAO.updateReadCount(board_num);
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = reviewDAO.selectArticle(board_num);
		System.out.println("6¹ø"+article.getNick());
		close(con);
		return article;
		
	}

}
