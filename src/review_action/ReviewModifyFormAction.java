package review_action;

import action.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			ReviewDetailService reviewDetailService
		    = new ReviewDetailService();	
			ReviewBean article =reviewDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/review_modify.jsp");
	   		return forward;
	   		

	   		
	 }
	 
}