package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;


public class BoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		System.out.println(request.getParameter("qpass"));
		System.out.println(request.getParameter("qnum"));
        
		ActionForward forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("qnum"));
		BoardBean article=new BoardBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();

		boolean isRightUser=boardModifyProService.isArticleWriter(board_num, request.getParameter("qpass"));

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setQnum(board_num);
			article.setQtitle(request.getParameter("qtitle"));
			article.setQcontent(request.getParameter("qcontent")); 
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num="+article.getQnum()); 
			}

		}

		return forward;
	}

}