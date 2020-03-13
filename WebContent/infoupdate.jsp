<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
#container{display:flex; align-items:center; position:relative; top:200px; left:80px;}
</style>

<script>

function modify()
{

var pw = passwordcheck.pw.value
if (pw =="")
{   
	alert("비밀번호를 입력하세요");
	passwordcheck.pw.focus()

}else{
	
	document.passwordcheck.submit();
	
}

}
function remove()
{

var pw = del.pw.value
var id = del.id.value
if (pw ==""&& id =="")
{   
	alert("비밃번호와 아이디 입력하세요");
	

}else if (pw =="")
{   
	alert("비밀번호를 입력하세요");
	del.pw.focus()

}else if (id ==""){
	alert("아이디를 입력하세요");
	del.id.focus()
}

else{
	
	document.del.submit();
	
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
<section style = "height : 960px">
<div id="container">

<form id="passwordcheck"  name = "passwordcheck" action = "update_check.jsp" method = post>

  <div class="form-group">

    <label for="pwdc">비밀번호</label>
    <input type="password" class="form-control" id="pw" name = "pw" placeholder="비밀번호를 입력하세요">
  </div>
 <button type = "button" class="btn btn-default" onClick = "modify()">정보수정</button>
</form>


<form id="del"name = "del" action = "delete_process.jsp" method = post>
<div class="form-group">
    <label for="ID">아이디</label>
    <input type="id" class="form-control" id="id"name = "id" placeholder="아이디를 입력하세요">
  </div>
  <div class="form-group">
    <label for="pwdc">비밀번호</label>
    <input type="password" class="form-control" id="pw" name = "pw" placeholder="비밀번호를 입력하세요">
  </div>
 <button type = "button" class="btn btn-default" onClick = "remove()">회원탈퇴</button>

</form>

</div>
</section>
<%@include file = "footer.jsp"%>


</body>
</html>
