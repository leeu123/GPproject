<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head><title></title></head>
<body>
<%
session.invalidate(); 
response.sendRedirect("gpindex.jsp");
%>
</body>
</html>