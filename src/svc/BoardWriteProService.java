package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{

		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(boardBean);
		System.out.println("boardwriteproservice 에서 리턴 받은 값"+insertCount);
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
