package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;

import action.Action;

 public class BoardSearchAction implements Action {
	  
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		  System.out.println("2번 ReviewSearchAction 페이지 ");
		  
		    BoardBean reviewBean = new BoardBean();
		    String search = (String) request.getParameter("searchvalues");
			String keyword = (String) request.getParameter("keyword");
			
		  System.out.println(search);
		   reviewBean.setSearch(search);
		   reviewBean.setKeyword(keyword);
 
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
		BoardListService boardListService = new BoardListService();
	
		
		if(search.equals("title")) {
		System.out.println("tite 확인");
		articleList = boardListService.getTitleList(reviewBean);
		
		}
		else{
		articleList = boardListService.getidList(reviewBean);
			
			
		}

		request.setAttribute("searchList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/Q_Asearch.jsp");
   		return forward;
   		
	 }
	 
 }