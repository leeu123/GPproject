package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.BoardDAO;
import vo.AnswerDTO;
import vo.BoardBean;

public class BoardReplyProService {

	public boolean replyArticle(AnswerDTO article) throws Exception{
		
		System.out.println("큐엔에이 답변달기 2번째");
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
