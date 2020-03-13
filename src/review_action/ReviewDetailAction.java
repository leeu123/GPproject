package review_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;
import action.Action;

 public class ReviewDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		ReviewBean article = reviewDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/review_boardview.jsp");
   		return forward;

	 }
	 
}