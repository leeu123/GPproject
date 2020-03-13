<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String nic=null;
    if(session.getAttribute("id")==null){
    	out.println("<script>");
		out.println("alert('로그인이 필요합니다..');");
		out.println("location.href='loginpage.jsp'");
		out.println("</script>");
    }
    else{
    	 nic = (String)session.getAttribute("nic");
    }

%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="css/partyboard_write_style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="shortcut icon"
	href="http://simbyone.com/wp-content/uploads/2014/04/3455e6f65c33232a060c28829a49b1cb.png">
<title>그린플레이트 게시판</title>
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic'
	rel='stylesheet' type='text/css'>

<link href="css/Icomoon/style.css" rel="stylesheet" type="text/css" />
<link href="css/animated-header.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>

<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<script type="text/javascript" src="_scripts/login.js"></script>
<link rel="stylesheet" type="text/css" href="css/boardstyle.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<%@include file="header.jsp"%>

	<nav>
		<img src="img\party.jpg" style="width: 100%; height: 100%;">
	</nav>

	<section style="min-height: 626px">
		<div id="write-bar">
			<form class="form-horizontal" method="post" action="hoogiAction.jsp">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="rtitle" name="rtitle"
							placeholder="게시글 제목을 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nick" name="nick"
							value=<%=nic %> Readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="message" class="col-sm-2 control-label">게시글</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="10" id="rcontent"
							name="rcontent" placeholder="게시글 내용을 입력하세요."></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<button type="submit" class="btn btn-success" id="write_button">작성완료</button>
					</div>
				</div>
			</form>
		</div>


	</section>
	<footer style="margin-top: 1px;">
		<%@include file="footer.jsp"%>
	</footer>



</body>
</html>
