<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>party action</title>
<jsp:useBean id="hoogi" class="hoogi.Hoogi" scope="page" />
<jsp:setProperty name="hoogi" property="*" />
<jsp:useBean id="hdao" class="hoogi.HoogiDAO" scope="page" />

</head>
<body>
	<%
		if (hoogi.getRtitle() == null || hoogi.getNick() == null || hoogi.getRcontent() == null) {
			out.println("<script>");
			out.println("alert('입력되지 않은 사항이 있습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			hdao.entdb();
			int rs = hdao.write(hoogi.getRtitle(), hoogi.getNick(), hoogi.getRcontent());

			if (rs == -1) {
				out.println("<script>");
				out.println("alert('오류가 있어요');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('입력되었어요');");
				out.println("location.href='partyboard.jsp';");
				out.println("</script>");
			}
		}
	%>


</body>
</html>