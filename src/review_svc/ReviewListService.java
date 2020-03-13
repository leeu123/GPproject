package review_svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import restaurantDAO.RestaurantDAO;
import review_dao.ReviewDAO;
import vo.DTO_AD;
import vo.ReviewBean;

public class ReviewListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		listCount = reviewDAO.selectListCount();
		System.out.println("1번 리스트카운트 작동"+listCount);
		close(con);
		return listCount;
		
	}

public ArrayList<ReviewBean> getLocalList(String local) throws Exception{

	ArrayList<ReviewBean> articleList = null;
	Connection con = getConnection();
	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	reviewDAO.setConnection(con);
	articleList = reviewDAO.selectLocalList(local);
	close(con);
	return articleList;
	
}
public boolean findcondition(String local) throws Exception {
	boolean findResult = false;
	Connection con = getConnection();
	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	reviewDAO.setConnection(con);
	findResult = reviewDAO.findcondition(local);
	close(con);
	return findResult;

}
//리뷰게시판에서 제목으로 게시물 검색 했을경우 조건에 맞는 게시물이 있는지 확인하기 위해서
public boolean findtitle_condition(ReviewBean dto) throws Exception {
	boolean findResult = false;
	Connection con = getConnection();
	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	reviewDAO.setConnection(con);
	findResult = reviewDAO.findtitle_condition(dto);
	close(con);
	return findResult;

}
//리뷰게시판에서 작성자로 게시물을 검색 했을경우 조건에 맞는 게시물이 있는지 확인하기 위해서
public boolean findnick_condition(ReviewBean dto) throws Exception {
	boolean findResult = false;
	Connection con = getConnection();
	ReviewDAO reviewDAO = ReviewDAO.getInstance();
	reviewDAO.setConnection(con);
	findResult = reviewDAO.findnick_condition(dto);
	close(con);
	return findResult;

}

	public ArrayList<ReviewBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<ReviewBean> articleList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		articleList = reviewDAO.selectArticleList(page,limit);
		
		close(con);
		return articleList;
		
	}
	public ArrayList<ReviewBean> getTitleList( ReviewBean reviewbean) throws Exception{
		
		ArrayList<ReviewBean> articleList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		articleList = reviewDAO.selectTitleList(reviewbean);
		close(con);
		return articleList;
		
	}
public ArrayList<ReviewBean> getidList(ReviewBean reviewbean) throws Exception{
		
		ArrayList<ReviewBean> articleList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		articleList = reviewDAO.selectIdList(reviewbean);
		
		close(con);
		return articleList;
		
	}

}
