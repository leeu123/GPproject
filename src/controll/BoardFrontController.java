package controll;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;

import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardSearchAction;
import action.BoardWriteProAction;
import member.License_action;
import member.License_insert;
import restaurant_action.RestaurantDetailAction;

import restaurant_action.RestaurantWriteProAction;
import review_action.ReviewDeleteProAction;
import review_action.ReviewDetailAction;
import review_action.ReviewListAction;
import review_action.ReviewLocalSearchAction;
import review_action.ReviewModifyFormAction;
import review_action.ReviewModifyProAction;
import review_action.ReviewReplyFormAction;

import review_action.ReviewSearchAction;
import review_action.ReviewWriteProAction;
import vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/boardWriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/qna_write.jsp");
		}else if(command.equals("/boardWritePro.bo")){
			action  = new BoardWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.bo")){
			action = new BoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.bo")){
			action = new BoardDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyForm.bo")){
			action = new BoardReplyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyPro.bo")){
			action = new BoardReplyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardModifyForm.bo")){
			action = new BoardModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.bo")){
			action = new BoardModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardDeleteForm.bo")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num",board_num);
			forward=new ActionForward();
			forward.setPath("/qna_delete.jsp");
		}
		else if(command.equals("/boardDeletePro.bo")){
			action = new BoardDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/reviewWriteForm.bo")){
			forward=new ActionForward();
			forward.setPath("/review_write.jsp");
		}else if(command.equals("/reviewWritePro.bo")){
			action  = new ReviewWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewList.bo")){
			action = new ReviewListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewDetail.bo")){
			action = new ReviewDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewReplyForm.bo")){
			action = new ReviewReplyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/reviewModifyForm.bo")){
			action = new ReviewModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/reviewLocalSearch.bo")){
			action = new ReviewLocalSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewModifyPro.bo")){
			action = new ReviewModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/reviewDeleteForm.bo")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num",board_num);
			forward=new ActionForward();
			forward.setPath("/review_delete.jsp");
		}
		else if(command.equals("/reviewDeletePro.bo")){
			action = new ReviewDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/reviewSearchList.bo")){
			
			action = new ReviewSearchAction();
			try{
				
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardSearchList.bo")){
			
			action = new BoardSearchAction();
			try{
				System.out.println("forward 실행");
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//식당정보 등록할때
		else if(command.equals("/restaurantWritePro.bo")){
			action  = new RestaurantWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//식당등록페이지를 들어갈때 사업자등록이 되어있는지 확인하기위한 작업
		else if(command.equals("/licensefind.bo")){
			System.out.println("1번"+request.getParameter("id"));
			String id = request.getParameter("id");
			request.setAttribute("id", id);
			action = new License_action();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//사업자등록
		else if(command.equals("/licenseInsert.bo")){
			action = new License_insert();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		//식당정보 보기
		else if(command.equals("/restaurantDetail.bo")){
			action = new RestaurantDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}