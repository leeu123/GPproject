<%@ page language="java" contentType="text/html; charset=UTF-8"
	errorPage="dbEx1.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>db연결</title>
</head>
<body>
	<h3>로그인 확인</h3>
	<%
	request.setCharacterEncoding("UTF-8");
    String pw = request.getParameter("pw");


Connection conn = null;
Statement stmt = null;
int i = 0;
try{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpteam","root","nicu0309");
if(conn ==null){
throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
}
	stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from membership where pw = '"+pw+"'; ");
	if(rs.next()){
				session.setAttribute("id",rs.getString("id"));
                session.setAttribute("pw",rs.getString("pw"));
				session.setAttribute("nic",rs.getString("nic"));
                session.setAttribute("name",rs.getString("name"));
				session.setAttribute("email",rs.getString("email"));
				session.setAttribute("pwa",rs.getString("pwa"));
				session.setAttribute("age",rs.getString("age"));
				session.setAttribute("sex",rs.getString("sex"));
                session.setAttribute("postnum",rs.getString("postnum"));
				session.setAttribute("home",rs.getString("home"));
                session.setAttribute("dethome",rs.getString("dethome"));
				session.setAttribute("cell",rs.getString("cell"));
                
				}else{
				  i++;
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
if(i==0){
// RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
//	dispatcher.forward(request, response); 
	response.sendRedirect("update.jsp");
}else if(i>=1){
	response.sendRedirect("update_false.jsp");
}
%>
</body>
</html>