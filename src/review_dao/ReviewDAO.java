package review_dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.DTO_AD;
import vo.ReviewBean;

public class ReviewDAO {

	DataSource ds;
	Connection con;
	private static ReviewDAO ReviewDAO;

	private ReviewDAO() {
		// TODO Auto-generated constructor stub
	}

	public static ReviewDAO getInstance(){
		if(ReviewDAO == null){
			ReviewDAO = new ReviewDAO();
		}
		return ReviewDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떦源띿삕.
	public int selectListCount() {
         System.out.println("카운트메소드 작동 ");
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
public ArrayList<ReviewBean> selectLocalList( String local){
        
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from board where location =?";
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean board = null;

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, local);		
 			
			rs = pstmt.executeQuery();
            
			while(rs.next()){
			
				board = new ReviewBean();
				board.setRnum(rs.getInt("rnum"));
				board.setNick(rs.getString("nick"));
				board.setRtitle(rs.getString("rtitle"));
				board.setRcontent(rs.getString("rcontent"));
				board.setRfile(rs.getString("rfile"));
				board.setLocation(rs.getString("location"));
				board.setReadcount(rs.getInt("readcount"));
				board.setDate(rs.getDate("date"));
				articleList.add(board);
			}
			
			

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

public boolean findcondition(String local) {
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String board_sql = "select location from board where location=?";
	boolean isWriter = false;

	try {
		pstmt = con.prepareStatement(board_sql);
		pstmt.setString(1, local);
		rs = pstmt.executeQuery();
		rs.next();
		{
           if(rs.getString("location").equals(local)) {
			isWriter = true;
           }
		}
	} catch (SQLException ex) {
		System.out.println(ex);
	} finally {
		close(pstmt);
	}

	return isWriter;

}


public boolean findtitle_condition(ReviewBean dto) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String board_sql = "select rtitle from board where rtitle like '%"+dto.getKeyword()+"%'";
	boolean isWriter = false;

	try {
		pstmt = con.prepareStatement(board_sql);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
           if(rs.getString("rtitle").contains(dto.getKeyword())) {
			isWriter = true;
           }
           else {
        	   isWriter = false;
           }
		}
	} catch (SQLException ex) {
		System.out.println(ex);
	} finally {
		close(pstmt);
	}

	return isWriter;

}

public boolean findnick_condition(ReviewBean dto) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String board_sql = "select nick from board where nick=?";
	boolean isWriter = false;

	try {
		pstmt = con.prepareStatement(board_sql);
		pstmt.setString(1, dto.getKeyword());
		rs = pstmt.executeQuery();
		if(rs.next());
		{
           if(rs.getString("nick").equals(dto.getKeyword())) {
			isWriter = true;
           }else {
        	   isWriter = false;
           }
		}
	} catch (SQLException ex) {
		System.out.println(ex);
	} finally {
		close(pstmt);
	}

	return isWriter;

}
	//�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕.	
	public ArrayList<ReviewBean> selectArticleList(int page,int limit){
        
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from board limit ?,10";
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean board = null;
		int startrow=(page-1)*10;
		
	
		try{
			pstmt = con.prepareStatement(board_list_sql);
		pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
            
			while(rs.next()){
				
				board = new ReviewBean();
				board.setRnum(rs.getInt("rnum"));
				board.setNick(rs.getString("nick"));
				board.setRtitle(rs.getString("rtitle"));
				board.setRcontent(rs.getString("rcontent"));
				board.setRfile(rs.getString("rfile"));
				board.setLocation(rs.getString("location"));
				board.setReadcount(rs.getInt("readcount"));
				board.setDate(rs.getDate("date"));
				articleList.add(board);
			}
			
			

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
public ArrayList<ReviewBean> selectTitleList(ReviewBean reviewbean){
        System.out.println("selectTtitleList 硫붿냼�뱶 �옉�룞");
        System.out.println(reviewbean.getKeyword());

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from board where rtitle like '%"+reviewbean.getKeyword()+"%'";
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean board = null;	
		
		try{
			pstmt = con.prepareStatement(board_list_sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println("while문 작동");
				board = new ReviewBean();
				board.setRnum(rs.getInt("rnum"));
				board.setNick(rs.getString("nick"));
				board.setRtitle(rs.getString("rtitle"));
				board.setRcontent(rs.getString("rcontent"));
				board.setRfile(rs.getString("rfile"));
				board.setLocation(rs.getString("location"));
				board.setReadcount(rs.getInt("readcount"));
				board.setDate(rs.getDate("date"));
				articleList.add(board);
			}
			
			

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

public ArrayList<ReviewBean> selectIdList(ReviewBean reviewbean){
	 String key = reviewbean.getKeyword();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String board_list_sql="select * from board where nick= ?";
	ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
	ReviewBean board = null;
	

	try{
		pstmt = con.prepareStatement(board_list_sql);
		pstmt.setString(1,key);
		rs = pstmt.executeQuery();
        
		while(rs.next()){
			
			board = new ReviewBean();
			board.setRnum(rs.getInt("rnum"));
			board.setNick(rs.getString("nick"));
			board.setRtitle(rs.getString("rtitle"));
			board.setRcontent(rs.getString("rcontent"));
			board.setRfile(rs.getString("rfile"));
			board.setLocation(rs.getString("location"));
			board.setReadcount(rs.getInt("readcount"));
			board.setDate(rs.getDate("date"));
			articleList.add(board);
		}
		
		

	}catch(Exception ex){
		System.out.println(ex);
	}finally{
		close(rs);
		close(pstmt);
	}

	return articleList;

}

	//�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕.
	public ReviewBean selectArticle(int board_num){
		System.out.println("4번"+board_num);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewBean boardBean = null;

		try{
			System.out.println("5번");
			pstmt = con.prepareStatement(
					"select * from board where rnum = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			if(rs.next()){
				boardBean = new ReviewBean();
				boardBean.setRnum(rs.getInt("rnum"));
				boardBean.setNick(rs.getString("nick"));
				boardBean.setRtitle(rs.getString("rtitle"));
				boardBean.setRcontent(rs.getString("rcontent"));
				boardBean.setRfile(rs.getString("rfile"));
				boardBean.setLocation(rs.getString("location"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setDate(rs.getDate("date"));
				boardBean.setRpass(rs.getString("rpass"));
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	//�뜝�룞�삕 �뜝�룞�삕�뜝占�.
	public int insertArticle(ReviewBean article){
        System.out.println("2"+article.getLocation());
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(rnum) from board");
			rs = pstmt.executeQuery();
		
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board (rnum,id,nick,rpass,rtitle,";
			sql+="rcontent, rfile,"+
					"readcount,"+
					"date,location) values(?,?,?,?,?,?,?,?,now(),?)";
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getNick());
			pstmt.setString(4, article.getRpass());
			pstmt.setString(5, article.getRtitle());
			pstmt.setString(6, article.getRcontent());
			pstmt.setString(7, article.getRfile());
			pstmt.setInt(8, 0);
			pstmt.setString(9, article.getLocation());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	
	public int updateArticle(ReviewBean article){
        System.out.println("6번");
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update board set rtitle=?,rcontent=? where rnum=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getRtitle());
			pstmt.setString(2, article.getRcontent());
			pstmt.setInt(3, article.getRnum());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕.
	public int deleteArticle(int board_num){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from board where rnum=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

	//�뜝�룞�삕�쉶�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃.
	public int updateReadCount(int board_num){
       
         System.out.println("3번");  
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board set readcount = "+
				"readcount+1 where rnum = "+board_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println(ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//�뜝�뙗�뼲�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕.
	public boolean isArticleBoardWriter(int board_num,String pass){
        System.out.println("3번"+board_num+pass);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from board where rnum=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();

			if(pass.equals(rs.getString("rpass"))){
				isWriter = true;
			}
		}catch(SQLException ex){
			System.out.println(ex);
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	

}
