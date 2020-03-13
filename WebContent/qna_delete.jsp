<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
    String nowPage = (String)request.getAttribute("page");
%>
<html lang="en">
<head>

	
<link rel="stylesheet" type="text/css" href="css/board_write_style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
		<img src="img\board_nav_img.jpg" style="width: 100%">
	</nav>

	<section style="min-height: 604px">
		<div id="write-bar">
			<form class="form-horizontal" role="form" name="deleteForm" action="boardDeletePro.bo?board_num=<%=board_num %>" method="post">
				<input type = "hidden" name = "page" value = "<%=nowPage %>"/>
				
				<div class="form-group">
					<label for="qtitle" class="col-sm-2 control-label">글 비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control"
							placeholder="게시글 제목을 입력하세요" name="qpass">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<input type="submit" value = "삭제" class="btn btn-success" style="color: white"/>
			            <input type = "button" value = "돌아가기" onClick ="javascript:history.go(-1)"class="btn btn-success" style="color: white"/>
					</div>
				</div>
		</div>
		</form>


	</section>
	<footer style="margin-top: 1px;">
		<%@include file="footer.jsp"%>
	</footer>



</body>
</html>
