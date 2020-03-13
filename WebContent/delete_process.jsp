<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>db연결</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
if(id==null)
throw new Exception("데이터 누락됨 ㅅㄱ");
Connection conn = null; Statement stmt = null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpteam","root","nicu0309");
if(conn ==null){
throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
}
	stmt=conn.createStatement();
	String command = String.format("delete from membership where id ='%s'and pw = '%s';",id,pw);
	int rowNum = stmt.executeUpdate(command); 
	if (rowNum<1){
		response.sendRedirect("delete_false.jsp");
	}if(rowNum>=1){
	    session.invalidate(); 
		response.sendRedirect("gpindex.jsp");
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