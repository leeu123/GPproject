<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
#container{display:flex; align-items:center; position:relative; top:200px; left:80px;}
</style>


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
function id_find()
{

var email = idsearch.Email.value
if (email =="")
{   
	alert("email을 입력하세요");
	idsearch.Email.focus()

}else{
	
	document.idsearch.submit();
	
}

}
function pw_find()
{

var email = pwsearch.email.value
var id = pwsearch.id.value
var pwa = pwsearch.pwa.value
if (email ==""&&id ==""&&pwa=="")
{   
	alert("모든 항목을 입력하세요");
	

}else if (email =="")
{   
	alert("이메일을 입력하세요");
	pwsearch.email.focus()

}else if (id ==""){
	alert("아이디를 입력하세요");
	pwsearch.id.focus()
}
else if (pwa ==""){
	alert("답을 입력하세요");
	pwsearch.pwa.focus()
}

else{
	
	document.pwsearch.submit();
	
}

}

</script>



</head>
<body>
	<%@include file = "header.jsp"%>
	<% String finded_id = "";
	if(request.getParameter("finded_id")!=null){
	finded_id = request.getParameter("finded_id");
	} %>
<section style = "height : 960px;">
<div id="container">

<form id="idsearch"  name = "idsearch" action = "idfind.jsp" method = post>

  <div class="form-group">

    <label for="Email">이메일 주소</label>
    <input type="email" class="form-control" id="Email" name = "Email" placeholder="이메일을 입력하세요">
  </div>
  <button type = "button" class="btn btn-default" onClick = "id_find()">아이디찾기</button>
</form>

<form id="pwsearch" name = "pwsearch"action = "pwfind.jsp" method = post>
<div class="form-group">
    <label for="ID">아이디</label>
    <input type="id" class="form-control" id="id"name = "id" value="<%=finded_id %>" placeholder="아이디를 입력하세요">
  </div>
  <div class="form-group">
    <label for="email">이메일 주소</label>
    <input type="email" class="form-control" id="email" name = "email" placeholder="이메일을 입력하세요">
  </div>
  <div class="form-group">
    <label for="hint">비밀번호 찾기 질문</label>
    <select class="form-control" id="pwhint"name = "pwhint">
									<option>본인의 보물1호</option>
									<option>가장 기억에 남는 장소</option>
									<option>본인의 별명</option>
									<option>부모님의 성함은</option>
									<option>태어난 곳</option>
								</select>
  </div>
  <div class="form-group">
    <label for="hint">비밀번호 찾기 답</label>
    <input type="text" name="pwa" class="form-control" id="pwa"
									placeholder="힌트 정답을 입력하세요" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '힌트 정답을 입력하세요'">
  </div>
  <button type = "button" class="btn btn-default" onClick = "pw_find()">비밀번호찾기</button>

</form>

</div>
</section>
<%@include file = "footer.jsp"%>
</body>
</html>
