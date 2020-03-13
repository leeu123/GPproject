package controll; //占쏙옙占쏙옙-> url 占쏙옙占쏙옙

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class partyControllerServlet extends HttpServlet {

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String rung = RequestURI.substring(contextPath.length());


			if (rung.equals("/partyregi.do")) {   // �뙆�떚 �벑濡�
				partyService service = new partyService();

				String index = service.inseParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
			}
			else if(rung.equals("/partycate.do")) {  // 진행중이파티로 이동
				partyService service = new partyService();
				String index = service.selelistParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyinfo.do")) {  // 吏꾪뻾以묒씤 �뙆�떚 �늻瑜대㈃ �굹�삤�뒗 �젙蹂�
				partyService service = new partyService();		
				String index = service.seleParty(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			
			else if(rung.equals("/partycatere.do")) { // �셿猷뚮맂 �뙆�떚 李얠븘�삤湲�
				partyService service = new partyService();
				String index = service.selelistPartyre(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyinfore.do")) {  // �셿猷뚮맂 �뙆�떚 �늻瑜대㈃ �굹�삤�뒗 �젙蹂�
				partyService service = new partyService();
				String index = service.selePartyre(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if(rung.equals("/partyapply.do")) {   // �뙆�떚 �떊泥��븯湲�
				partyService service = new partyService();
				
				String index = service.inseApply(request, response);
				request.getRequestDispatcher(index).forward(request, response);
				
			}
			else if (rung.equals("/navsearch.do")) {
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

		
			
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
