package controll; //占쏙옙占쏙옙-> url 占쏙옙占쏙옙

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.do")
public class partyControllerServlet extends HttpServlet {

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String rung = RequestURI.substring(contextPath.length());  // url 의 주소를 받는 변수


			if (rung.equals("/partyregi.do")) {   // 파티 모집 시
				partyService service = new partyService();

				String index = service.inseParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
			}
			else if(rung.equals("/partycate.do")) {  // 진행중인 파티 중 음식 카테고리 별 파티 추출
				partyService service = new partyService();
				String index = service.selelistParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyinfo.do")) {  // 식당 정보 추출
				partyService service = new partyService();		
				String index = service.seleParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			
			else if(rung.equals("/partycatere.do")) { // 완료된 파티 중 음식 카테고리 별 파티 추출
				partyService service = new partyService();
				String index = service.selelistPartyre(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyinfore.do")) {  // 완료된 파티 중 음식 카테고리 별 파티 추출
				partyService service = new partyService();
				String index = service.selePartyre(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyapply.do")) {  // 파티 신청 시
				partyService service = new partyService();
				
				String index = service.inseApply(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if (rung.equals("/navsearch.do")) { // index에서 검색 시
				System.out.println("navsearch");
				partyService service = new partyService();
				String index = service.navsearch(request, response);
				request.getRequestDispatcher(index).forward(request, response);
			}
			else if (rung.equals("/navsearch2.do")) {
				System.out.println("navsearch");
				partyService service = new partyService();
				String index = service.navsearch2(request, response);
				request.getRequestDispatcher(index).forward(request, response);
			}
			
			
			else if(rung.equals("/reservation.do")) {   // 식당 예약하기
				partyService service = new partyService();
				
				String index = service.reservation(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
		}
			else if (rung.equals("/searchbar.do")) {
				System.out.println("searchbar");
				String keyword = request.getParameter("keyword_searchbar");
				if (keyword!="") {
				partyService service = new partyService();
				String index = service.searchbar(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			} else {				
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter script = response.getWriter();
                    script.println("<script>");
					script.println("alert('검색결과가 없습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
			
			else if (rung.equals("/searchbar2.do")) {
				HttpSession session = request.getSession();
				String page = request.getParameter("page");
				System.out.println(page);
				
				partyService service = new partyService();
				String index = service.searchbar2(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			
			}
			
			else if(rung.equals("/deleteresdat.do")) {  // 마이페이지 댓글 삭제시
				partyService service = new partyService();
				
				boolean index = service.deleteresdat(request, response);
				request.getRequestDispatcher("manage.jsp").forward(request, response);
				
			}
			
			else if(rung.equals("/deleteqna.do")) {  // 마이페이지 QnA 삭제시
				partyService service = new partyService();
				
				boolean index = service.deleteqna(request, response);
				if(index) {
					request.getRequestDispatcher("manage.jsp").forward(request, response);
					}
					else {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('질문에 답글이 있어서 삭제가 불가능합니다.');");
						out.println("location.href='manage.jsp';");
						out.println("</script>");
						
					}
			}
			
			else if(rung.equals("/deleteparty.do")) {  // 마이페이지 QnA 삭제시
				partyService service = new partyService();
				
				boolean index = service.deleteparty(request, response);
				if(index) {
					request.getRequestDispatcher("manage.jsp").forward(request, response);
					}
					else {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('후기나 신청인원이 있어서 삭제가 불가능합니다.');");
						out.println("location.href='manage.jsp';");
						out.println("</script>");
						
					}
			}
			
			else if(rung.equals("/deletereview.do")) {  // 마이페이지 QnA 삭제시
				partyService service = new partyService();
				
				boolean index = service.deletereview(request, response);
				
				if(index) {
				request.getRequestDispatcher("manage.jsp").forward(request, response);
				}
				else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('리뷰에 답글이 있어서 삭제가 불가능합니다.');");
					out.println("location.href='manage.jsp';");
					out.println("</script>");
					
				}
					
			}
			
			else if(rung.equals("/deleterestau.do")) {  // 마이페이지 QnA 삭제시
				partyService service = new partyService();
				
				boolean index = service.deleterestau(request, response);
				if(index) {
					request.getRequestDispatcher("manage.jsp").forward(request, response);
					}
					else {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('댓글이 있어서 삭제가 불가능합니다.');");
						out.println("location.href='manage.jsp';");
						out.println("</script>");
						
					}
			}

		
			
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
