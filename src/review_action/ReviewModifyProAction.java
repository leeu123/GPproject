package review_action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewModifyProService;
import vo.ActionForward;
import vo.ReviewBean;
import action.Action;

public class ReviewModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		System.out.println("1번");
	
		ActionForward forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("rnum"));
		ReviewBean article=new ReviewBean();
		ReviewModifyProService reviewModifyProService = new ReviewModifyProService();

		boolean isRightUser=reviewModifyProService.isArticleWriter(board_num, request.getParameter("rpass"));

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
		    System.out.println("4번");
			article.setRnum(board_num);
			article.setRtitle(request.getParameter("rtitle"));
			article.setRcontent(request.getParameter("rcontent"));
			isModifySuccess = reviewModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				System.out.println("7번");
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("reviewDetail.bo?board_num="+article.getRnum()); 
			}

		}

		return forward;
	}

}