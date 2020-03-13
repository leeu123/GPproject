package action;

import javax.servlet.http.*;

import vo.ActionForward;

public interface Action { //인터페에스
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
