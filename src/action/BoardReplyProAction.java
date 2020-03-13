package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardReplyProService;
import vo.ActionForward;
import vo.AnswerDTO;
import vo.BoardBean;

public class BoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
	         System.out.println("�亯�޸� 1��°");
		 	ActionForward forward = null;
		    String nowPage = request.getParameter("page");
		 	AnswerDTO article = new AnswerDTO();  		
		 	article.setQnum(Integer.parseInt(request.getParameter("qnum")));
		 	article.setNick(request.getParameter("nick"));
		 	article.setId(request.getParameter("loginId"));
		 	article.setAnswer(request.getParameter("qcontent"));
		 	BoardReplyProService boardReplyProService = new BoardReplyProService();
		 	boolean isReplySuccess = boardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			System.out.println("isReplySuccess �۵�");
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("boardList.bo?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('�������')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}