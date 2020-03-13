<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String pnum = request.getParameter("postnum");
		String ni = request.getParameter("nick");
		String pti = request.getParameter("ptitle");
		String con = request.getParameter("content");
		
	
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpteam?useSSL=false&useUnicode=true&characterEncoding=utf8", "root", "nicu0309");
			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
			}
			stmt = conn.createStatement();
			String command = String.format("update preview set rtitle = '%s',rcontent = '%s' where rpostnum =%s;",pti,con,pnum);
			stmt.executeUpdate(command);
			response.sendRedirect("partyboard.jsp");
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
	%>

</body>
</html>