<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="controll.partyService" %>

<html>
<head>
</head>
<body>
<%
String id = request.getParameter("id");
int rnum = Integer.parseInt(request.getParameter("rnum"));

request.setAttribute("id", id);
request.setAttribute("rnum", rnum);


partyService ps = new partyService();
boolean s = ps.rescancel(request, response);



	response.sendRedirect("restaurantDetail.bo?rnum="+rnum);


%>
	
</body>
</html>