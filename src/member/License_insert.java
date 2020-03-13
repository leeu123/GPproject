package member;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review_svc.ReviewWriteProService;
import vo.ActionForward;
import action.Action;
import model.LicenseDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class License_insert implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		LicenseDTO dto = null;
		
	
		dto = new LicenseDTO();
		dto.setId(request.getParameter("id"));
		dto.setLicense(request.getParameter("license"));
		
        License_service licesne_service = new License_service();
		boolean isWriteSuccess = licesne_service.insert(dto);
		System.out.println(isWriteSuccess);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("gpindex.jsp");
		}

		return forward;
		
	}  	
	
}