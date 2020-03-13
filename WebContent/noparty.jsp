<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- useBean은 자바빈 객체를 생성하는 액션태그이다. -->
<jsp:useBean id="party" class="party.PartyDTO" scope="page" >
<jsp:setProperty name="party" property="*"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equive="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('파티가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		
		
	%>

</body>
</html>