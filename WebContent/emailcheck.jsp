<%@ page language="java" contentType="text/html; charset=UTF-8"	%>
<%@ page import="java.sql.*"%>
<html>
<head>

</head>
<body>
<%
String email = request.getParameter("email");
String check = null;
int a = 0;
Connection conn = null;
Statement stmt = null;
int i = 0;
try{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpteam","root","12345");
if(conn ==null){
throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
}
	stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from membership where email = '"+email+"';");
	if(rs.next()){
		%>
	<% out.println("동일한 이메일이 있습니다.");
		 check="0";%>
		 <input type = "button" value="닫기" onClick="setemail()">
	<%
			 }else{
   out.println("이메일을 사용할 수 있습니다.");
  check="1";%>
	  <input type = "button" value="닫기" onClick="setemail()">
				<%}			
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
<script language="javascript">
function setemail(){
opener.document.naver.hidden.value="<%=check%>";
self.close();
}
</script>
</body>
</html>