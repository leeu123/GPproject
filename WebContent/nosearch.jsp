<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('검색결과가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		
		
	%>


</body>
</html>