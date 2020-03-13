package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.AnswerDTO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService 작동");
		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		System.out.println("updateCount="+updateCount);
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}
	public int getExist(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService 작동");
		int i = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		i = boardDAO.exist(board_num);
		close(con);
		return i;
		
	}

	public AnswerDTO getAnswerList(int board_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("BoardDetailService 작동");
		AnswerDTO article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		article = boardDAO.selectAnswer(board_num);
		close(con);
		return article;
		
	}


}
