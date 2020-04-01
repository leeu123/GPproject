package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.AnswerDTO;
import vo.BoardBean;


 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	System.out.println("BoardDetailAction �۵�");
	   	AnswerDTO answer;
	   	ActionForward forward = new ActionForward();
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		if(request.getParameter("id").equals("id")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("history.back();");
			out.println("</script>");
			
		}else
		{
			
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		int i = boardDetailService.getExist(board_num);
		if(i==1) {
			answer = boardDetailService.getAnswerList(board_num);
			request.setAttribute("answer", answer);
			request.setAttribute("i", i);
		}else {
			request.setAttribute("i", i);
		}
		System.out.println(article.getQnum());
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   
   		forward.setPath("/qna_boardview.jsp");
   		
		}return forward;
	 }
	 
}