package review_action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import review_svc.ReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.PageInfo_party;
import vo.ReviewBean;

public class ReviewLocalSearchAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		  
		 ActionForward forward= new ActionForward();
		    
			String local = request.getParameter("local");
			ReviewListService model = new ReviewListService();
			boolean isRightUser = model.findcondition(local);
			//리턴받은 값이 false면 경고문구를 띄우고 true면 정상적으로 조건검색 결과를 보여주도록 하기위한 작업
			if (!isRightUser) {
				request.setAttribute("false",isRightUser);
				forward.setPath("/board1.jsp");
				return forward;
			}
			else {
			
			request.setAttribute("false",isRightUser);
			ArrayList<ReviewBean> list = (ArrayList<ReviewBean>)model.getLocalList(local);
			System.out.println("최종리턴받은값="+list.get(0).getLocation());
			request.setAttribute("searchList", list);
	   		forward.setPath("/board1.jsp");		
	   		return forward;
			}
	}
}
