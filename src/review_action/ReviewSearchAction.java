package review_action;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewListService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.PageInfo;
import action.Action;


public class ReviewSearchAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewBean reviewBean = new ReviewBean();
		// searchvalues는 작성자로 검색했는지 제목으로 검색햇는지 그 값을 가져오는거
		String search = (String) request.getParameter("searchvalues");
		String keyword = (String) request.getParameter("keyword");
		ActionForward forward = new ActionForward();
		reviewBean.setSearch(search);
		reviewBean.setKeyword(keyword);
		ReviewListService reviewListService = new ReviewListService();
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
        //작성자로 검색했는지 제목으로 검색했는지 구분하기위해서
		if (search.equals("title")) {
			boolean isRightUser = reviewListService.findtitle_condition(reviewBean);
			// 리턴받은 값이 false면 경고문구를 띄우고 true면 정상적으로 조건검색 결과를 보여주도록 하기위한 작업
			if (!isRightUser) {
				request.setAttribute("false",isRightUser );	
				forward.setPath("/board1.jsp");
				return forward;

			} else {
				articleList = reviewListService.getTitleList(reviewBean);

			}
		} else {

			boolean isRightUser = reviewListService.findnick_condition(reviewBean);

			// 리턴받은 값이 false면 경고문구를 띄우고 true면 정상적으로 조건검색 결과를 보여주도록 하기위한 작업
			if (!isRightUser) {
				request.setAttribute("false",isRightUser );	
				forward.setPath("/board1.jsp");
				return forward;
			} else {
				articleList = reviewListService.getidList(reviewBean);

			}
		}
		request.setAttribute("searchList", articleList);
		forward.setPath("/board1.jsp");
		return forward;

	}

}