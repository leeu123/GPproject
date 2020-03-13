package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;

import vo.BoardBean;


public class BoardListService {

	public int getListCount() throws Exception{
		System.out.println("boardlistservie getlistcount()메소드 실행");
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		System.out.println("리턴값"+listCount);
		close(con);
		return listCount;
		
	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) throws Exception{
		System.out.println("getArticleList 작동");
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);
		System.out.println(articleList.size());
		close(con);
		return articleList;
		
	}
	public ArrayList<BoardBean> getTitleList(BoardBean boardbean) throws Exception{
		System.out.println("gettitlelist 확인");
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO reviewDAO = BoardDAO.getInstance();
		reviewDAO.setConnection(con);
		articleList = reviewDAO.selectTitleList(boardbean);
		
		close(con);
		return articleList;
		
	}
public ArrayList<BoardBean> getidList(BoardBean reviewbean) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO reviewDAO = BoardDAO.getInstance();
		reviewDAO.setConnection(con);
		articleList = reviewDAO.selectIdList(reviewbean);
		
		close(con);
		return articleList;
		
	}

}
