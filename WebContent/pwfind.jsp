<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
#container{display:flex; align-items:center; position:relative; top:200px; left:80px;}
</style>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css"/>
<link rel="stylesheet" type="text/css" href="css/infosearch.css"/>

<link rel="shortcut icon"
	href="http://simbyone.com/wp-content/uploads/2014/04/3455e6f65c33232a060c28829a49b1cb.png">
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic'>

<link rel="stylesheet" type="text/css" href="css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="css/animated-header.css" />

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="_scripts/login.js"></script>
<script>

function radio_check(){


var radio = id.finded_id.checked

if(radio == false){
alert("비밀번호를 체크하세요");

}

else{
	document.pw.submit();
}

} 
</script>

</head>
<body>
	<%@include file = "header.jsp"%>
<section style = "height : 1000px">
<div id="container">

<%
String email = (String)request.getParameter("email");
String pwfind_id = (String)request.getParameter("id");

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
	ResultSet rs = stmt.executeQuery("select * from membership where email = '"+email+"'and id = '"+pwfind_id+"';");
		if(rs.next()){%>
			<div style = "width : 800px ;height : 300px; border : 1px solid ">
			<p><span style = "font-size : 25px; font-weight : bold">비밀번호 찾기</span></p>
			고객님의 정보와 일치하는 비밀번호 입니다.<br><br>

		  <div style = "width : 800px; height : 100px; border : 1px solid">
		
			 <div style = "margin-top : 35px; margin-left : 320px">
			 <form action = "loginpage.jsp" method = post name = "pw">
			 <input type = "radio" name = "finded_id" >
			 <span style = "font-size : 16px; font-weight : bold;">
			  <% out.println(rs.getString("pw"));%>
			 </span>
			 </div>
			  </div>
			  <div style = "margin-left: 295px; margin-top: 20px;">
			   <button type = "button"  class="btn btn-success" style = "width : 100px;" value = "로그인 하기" onClick = "radio_check()">로그인하기</button></form>
			   <a href = "infosearch.jsp"><button type="button" class="btn btn-success" style = "width : 110px;">비밀번호찾기</button></a>
			 </div>
			 
			 </div>
			 
		<%}else{
			 response.sendRedirect("pwfind_false.jsp");
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
</div>


</section>
<%@include file = "footer.jsp"%>
</body>
</body>
</html>
