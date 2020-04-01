<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>
function login_check()
{
var pw = login.pw.value
var id = login.id.value
if (id =="")
{   
	alert("아이디를 입력하세요");
	login.id.focus()

}else if (pw =="")
{
	alert("비밀번호를 입력하세요");
	login.pw.focus()
}
else{
	
	document.login.submit();
	
}

}


function onEnterSubmit(){
//엔터키의 경우 13번의 키코드를 가지고 있어서 엔터를 누르게 되면 if문이 작동한다.
var keyCode = window.event.keyCode;
if(keyCode==13) login.submit();
}


</script>

<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/infosearch.css" />
<link rel="stylesheet" type="text/css" href="css/loginpage.css" />
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
	<%@include file="header.jsp"%>
    <% 
    
    String idid="";
    if((String)request.getParameter("finded_id")!=null){
    	
    idid = (String)request.getParameter("finded_id");
    
    }
   %>
   
	<section style="height: 960px;">
		<div id="container">
			<div id="login_box">
				<form action="loginAction.jsp" method=post id="login" name="login">
					<div id="login_id_textbox">
						<input type="text" value="<%=idid%>" name="id"
							id="login_idpw_text" placeholder="아이디"
							onfocus="this.placeholder = ''" onblur="아이디'">
					</div>
					<div id="login_pw_textbox">
						<input type="password" onkeydown='javascript:onEnterSubmit()' name="pw" id="login_idpw_text"
							placeholder="비밀번호" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호'">
					</div>
					<button onClick="login_check()" type="button"
						class="btn btn-success" id="login_button">로그인</button>
					<div id="login_infoserch">
						<UL style="padding-left: 0px">
							<li id="infoserch_li"><a href="infosearch.jsp"><font
									size=2px>아이디 찾기</font></a> |</li>
							<li id="infoserch_li"><a href="infosearch.jsp"><font
									size=2px>비밀번호찾기</font></a></li>
							<li id="infoserch_li">|<a href="membership.jsp"> <font
									size=2px> 회원가입</font></a></li>
						</UL>
					</div>

				</form>
			</div>
		</div>
	</section>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>
