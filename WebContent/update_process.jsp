<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>db연결</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String nic = request.getParameter("nic");
String pw = request.getParameter("pw");
String pwhint = request.getParameter("pwhint");
String pwa = request.getParameter("pwa");
String name = request.getParameter("name");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String email = request.getParameter("email");
String home = request.getParameter("home");
String dethome = request.getParameter("dethome");
String cell = request.getParameter("cell");
String postnum = request.getParameter("postnum");
String pworiginal = (String) session.getAttribute("pworiginal");
Connection conn = null; Statement stmt = null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpteam?useSSL=false&useUnicode=true&characterEncoding=utf8","root","nicu0309");
if(conn ==null){
throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
}
	stmt=conn.createStatement();
	String command = String.format("update membership set nic='%s',pw='%s',name='%s',pwhint='%s',pwa='%s', age='%s',sex='%s',email='%s',postnum='%s',home='%s',dethome='%s',cell='%s'where pw ='%s'; ", nic,pw,name,pwhint,pwa,age,sex,email,postnum,home,dethome,cell,pworiginal);
	
	int rowNum = stmt.executeUpdate(command); 
	if (rowNum>=1){
	//RequestDispatcher dispatcher = request.getRequestDispatcher("gpgp.jsp");
	//dispatcher.forward(request, response); 
		response.sendRedirect("gpindx.jsp");
	}
}finally{
try{
stmt.close();
}catch(Exception ignored){
}try{
conn.close();
}catch(Exception ignored){
}
}


%>
</body>
</html>