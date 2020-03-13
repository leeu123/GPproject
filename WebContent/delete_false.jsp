<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
#container{display:flex; align-items:center; position:relative; top:200px; left:80px;}
</style>

<script>

function idfind()
{
var email = idsearch.email.value

if (email == "")
{   
	alert("이메일을 입력하세요");
	idsearch.email.focus()

}else{
	
	window.open("idfind.jsp?email="+idserch.email.value,"hjhj","width=500,height=500");
}
}
</script>

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




</head>
<body>
		<%@include file = "header.jsp"%>
<section style = "height : 1000px">
<div id="container">

<form id="passwordcheck"  name = "passwordcheck" action = "update_check.jsp" method = post>

  <div class="form-group">

    <label for="pwdc">비밀번호</label>
    <input type="password" class="form-control" id="Password" name = "pw" placeholder="비밀번호를 입력하세요">
  </div>
  <input type = "submit" class="btn btn-default" value = "내 정보 확인">
</form>


<form id="del" action = "delete_process.jsp" method = post>
<div class="form-group">
    <label for="ID">아이디</label>
    <input type="id" class="form-control" id="id"name = "id" placeholder="아이디를 입력하세요">
  </div>
  <div class="form-group">
    <label for="pwdc">비밀번호</label>
    <input type="password" class="form-control" id="Password" name = "pw" placeholder="비밀번호를 입력하세요">
    <div style= "color: red">회원님의 정보와 일치하는 정보가 업습니다.</div>
  </div>
  <input type="submit" class="btn btn-default" value = "회원 탈퇴">

</form>

</div>
</section>
<%@include file = "footer.jsp"%>


</body>
</html>
