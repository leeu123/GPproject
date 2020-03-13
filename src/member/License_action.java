package member;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewModifyProService;
import vo.ActionForward;
import action.Action;

public class License_action implements Action {
//아이디를 전달받아서 License_service.java 페이지로 보내서 아이디가 디비에 등록이 되어있으 식당등록 페이지로 이동하고 아니면 사업자등록이 안되 있다고 알져눈 페이지
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("2번"+request.getParameter("id"));
		ActionForward forward = null;
		boolean isModifySuccess = false;
		License_service License_service = new License_service();
		boolean isRightUser = License_service.isArticleWriter(request.getParameter("id"));

		if (!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사업자등록 번호가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {

		
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("advertisement.jsp");

		}

		return forward;
	}

}