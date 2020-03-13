package review_svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.ReviewBean;
import review_dao.ReviewDAO;

public class ReviewModifyProService {
//디비에 저장되있는 비밀번호랑 게시글 수정 자가 입력한 비밀번호가 동일한지 확인하기 위한 작업
	public boolean isArticleWriter(int board_num, String pass) throws Exception {
	     System.out.println("2번");
		boolean isArticleWriter = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		isArticleWriter = reviewDAO.isArticleBoardWriter(board_num, pass);
		System.out.println("리턴확인"+isArticleWriter);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(ReviewBean article) throws Exception {
	     System.out.println("5번");
		boolean isModifySuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int updateCount = reviewDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
