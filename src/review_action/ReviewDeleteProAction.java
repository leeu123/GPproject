package review_action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewDeleteProService;
import vo.ActionForward;
import action.Action;

public class ReviewDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		boolean isArticleWriter =reviewDeleteProService.isArticleWriter(board_num, request.getParameter("rpass"));

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = reviewDeleteProService.removeArticle(board_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("reviewList.bo?page=" + nowPage);
			}
			
		}


		return forward;
	}

}