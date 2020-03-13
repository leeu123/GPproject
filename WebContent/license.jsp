<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>
function login_check()
{
var license = li.license.value
var licens_length = li.license.value.length
var num= /^[0-9]{10,10}$/

if (license =="")
{   
	alert("사업자 번호를 입력하세요");
	li.license.focus()

}else if (false === num.test(license))
{
	alert("숫자만 입력하고 10자를 입력하세요");
	li.license.focus()
}

else{
	
	document.li.submit();
	
}

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

	<section style="height: 960px;">
		<div id="container">
			<div id="login_box">
			<span style = "    margin-left: 191px;
    font-size: 20px;" >사업자등록</span>
				<form action="licenseInsert.bo?" method=post id="li" name="li">
				
					<div id="login_id_textbox">
						<input type="text" value='' name="license"
							id="login_idpw_text" placeholder="사업자 번호를 입력하세요"
							onfocus="this.placeholder = ''" maxlength ="10">
						<input type ="hidden" name="id" value="<%= id%>">	
					</div>
	
					<button onClick="login_check()" type="button"
						class="btn btn-success" id="login_button">등록</button>
					

				</form>
			</div>
		</div>
	</section>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>
