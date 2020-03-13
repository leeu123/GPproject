package restaurant_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import restaurant_svc.RestaurantDetailService;
import vo.ActionForward;
import vo.DTO_AD;
import action.Action;

 public class RestaurantDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
        System.out.println("1¹ø");
		int rnum=Integer.parseInt(request.getParameter("rnum"));
		String page = request.getParameter("page");
		RestaurantDetailService restaurantDetailService = new RestaurantDetailService();
		DTO_AD article = restaurantDetailService.getArticle(rnum);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/restaurant.jsp");
   		return forward;

	 }
	 
}