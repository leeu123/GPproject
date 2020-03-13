package review_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;
import action.Action;

public class ReviewReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int board_num=Integer.parseInt(request.getParameter("board_num"));
	   		ReviewDetailService reviewDetailService = new ReviewDetailService();
	   		ReviewBean article=reviewDetailService.getArticle(board_num);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("qna_boardreply.jsp");
	   		return forward;
	   		
	}
	 
}