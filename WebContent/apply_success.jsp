<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.*"%>


<head>
<title>Party Apply</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gpstylepartyapply.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/apply_success.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<script type="text/javascript" src="scripts/party.js"></script>
<script>
</script>
</head>
<body>
	<%@include file="header.jsp"%>

	<div style="width: 1950px; height: 86px;"></div>
	<article></article>
	<section style="background: #f6f6f6;">
		<div style="width: 55%; height: 100%; background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
		<div style="margin:0 auto;"><h1>파티 신청이 완료되었습니다.</h1>
		<a href="gpindex.jsp"><button type="button" class="btn btn-success">홈으로</button></a>
		<a href="party.jsp"><button type="button" class="btn btn-success">파티 창으로</button></a>	
		
		</div>
	
		 
			

			
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
