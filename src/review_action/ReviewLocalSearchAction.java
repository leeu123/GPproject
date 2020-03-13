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
			//���Ϲ��� ���� false�� ������� ���� true�� ���������� ���ǰ˻� ����� �����ֵ��� �ϱ����� �۾�
			if (!isRightUser) {
				request.setAttribute("false",isRightUser);
				forward.setPath("/board1.jsp");
				return forward;
			}
			else {
			
			request.setAttribute("false",isRightUser);
			ArrayList<ReviewBean> list = (ArrayList<ReviewBean>)model.getLocalList(local);
			System.out.println("�������Ϲ�����="+list.get(0).getLocation());
			request.setAttribute("searchList", list);
	   		forward.setPath("/board1.jsp");		
	   		return forward;
			}
	}
}
