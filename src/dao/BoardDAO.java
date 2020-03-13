package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.AnswerDTO;
import vo.BoardBean;
import vo.ReviewBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//���� ���� ���ϱ�.
	public int selectListCount() {
         System.out.println("DAO�� selectlistcount �۵� ");
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from qnaboard");
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

	//�� ��� ����.	
	public ArrayList<BoardBean> selectArticleList(int page,int limit){
         System.out.println("DAO selctArticleList �۵�");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from qnaboard order by qnum desc limit ?,10";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*10; //�б� ������ row ��ȣ..	
	
		try{
			pstmt = con.prepareStatement(board_list_sql);
		pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				System.out.println("1");
				board = new BoardBean();
				board.setQnum(rs.getInt("qnum"));
				board.setNick(rs.getString("nick"));
				board.setQpass(rs.getString("qpass"));
				board.setQtitle(rs.getString("qtitle"));
				board.setQcontent(rs.getString("qcontent"));
				board.setQfile(rs.getString("qfile"));
				board.setReadcount(rs.getInt("readcount"));
				board.setDate(rs.getDate("date"));
				articleList.add(board);
			}
			System.out.println("ll"+ articleList.size());
			

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	public ArrayList<BoardBean> selectTitleList(BoardBean reviewbean){
      
        String key = reviewbean.getKeyword();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from qnaboard where qtitle = ?";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;	
		
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1,key);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println("1");
				board = new BoardBean();
				board.setQnum(rs.getInt("qnum"));
				board.setNick(rs.getString("nick"));
				board.setQtitle(rs.getString("qtitle"));
				board.setQcontent(rs.getString("qcontent"));
				board.setQfile(rs.getString("qfile"));
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

public ArrayList<BoardBean> selectIdList(BoardBean reviewbean){
	 String key = reviewbean.getKeyword();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String board_list_sql="select * from qnaboard where nick= ?";
	ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
	BoardBean board = null;
	

	try{
		pstmt = con.prepareStatement(board_list_sql);
		pstmt.setString(1,key);
		rs = pstmt.executeQuery();
        
		while(rs.next()){
			
			System.out.println("1");
			board = new BoardBean();
			board.setQnum(rs.getInt("qnum"));
			board.setNick(rs.getString("nick"));
			board.setQtitle(rs.getString("qtitle"));
			board.setQcontent(rs.getString("qcontent"));
			board.setQfile(rs.getString("qfile"));
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

	//�� ���� ����.
	public BoardBean selectArticle(int board_num){
        System.out.println("selectArticle�۵�");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from qnaboard where qnum = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			System.out.println(pstmt);

			if(rs.next()){
				System.out.println("�۵�");
				boardBean = new BoardBean();
				boardBean.setQnum(rs.getInt("qnum"));
				boardBean.setNick(rs.getString("nick"));
				boardBean.setQtitle(rs.getString("qtitle"));
				boardBean.setQcontent(rs.getString("qcontent"));
				boardBean.setQfile(rs.getString("qfile"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setDate(rs.getDate("date"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}
	
	public AnswerDTO selectAnswer(int board_num){
        System.out.println("selectArticle�۵�");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AnswerDTO answer = null;

		try{
			pstmt = con.prepareStatement(
					"select * from qna_answer where qnum = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			System.out.println(pstmt);

			if(rs.next()){
				System.out.println("�۵�");
				answer = new AnswerDTO();
				answer.setQnum(rs.getInt("qnum"));
				answer.setNick(rs.getString("nick"));
				answer.setId(rs.getString("id"));
				answer.setAnswer(rs.getString("answer"));			
				answer.setDate(rs.getDate("date"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return answer;

	}

	public int exist(int board_num){
        System.out.println("selectArticle�۵�");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int i = 0;

		try{
			pstmt = con.prepareStatement(
					"select * from qna_answer where qnum = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();
			System.out.println(pstmt);

			if(rs.next()){
				i=1;
			}
			else {
				i=0;
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return i;

	}
	//�� ���.
	public int insertArticle(BoardBean article){		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(qnum) from qnaboard");
			rs = pstmt.executeQuery();
			System.out.println("insertArticle �ȿ� �ִ� try�� ����");

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into qnaboard (qnum,nick,qpass,qtitle,qcontent, qfile,readcount,date,id) values(?,?,?,?,?,?,?,now(),?)";
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getNick());
			pstmt.setString(3, article.getQpass());
			pstmt.setString(4, article.getQtitle());
			pstmt.setString(5, article.getQcontent());
			pstmt.setString(6, article.getQfile());
			pstmt.setInt(7, 0);
			pstmt.setString(8, article.getId());
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//�� �亯.
	public int insertReplyArticle(AnswerDTO article){
     
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;
		try{
			
			sql="insert into qna_answer (qnum,nick,id,answer,date) values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article.getQnum());
			pstmt.setString(2, article.getNick());
            pstmt.setString(3,article.getId());
			pstmt.setString(4, article.getAnswer());
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	//�� ����.
	public int updateArticle(BoardBean article){
      System.out.println(article.getQtitle());
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update qnaboard set qtitle=?,qcontent=? where qnum=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getQtitle());
			pstmt.setString(2, article.getQcontent());
			pstmt.setInt(3, article.getQnum());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//�� ����.
	public int deleteArticle(int board_num){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from qnaboard where qnum=?";
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

	//��ȸ�� ������Ʈ.
	public int updateReadCount(int board_num){
           System.out.println("updateReadCount�۵�");
           
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update qnaboard set readcount = "+
				"readcount+1 where qnum = "+board_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//�۾������� Ȯ��.
	public boolean isArticleBoardWriter(int board_num,String pass){
        System.out.println(board_num+pass);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from qnaboard where qnum=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			rs.next();

			if(pass.equals(rs.getString("qpass"))){
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
