package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;


public class BoardReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int board_num=Integer.parseInt(request.getParameter("board_num"));
	   		request.setAttribute("qnum", board_num);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("qna_boardreply.jsp");
	   		return forward;
	   		
	}
	 
}