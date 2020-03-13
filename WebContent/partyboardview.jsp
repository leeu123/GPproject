<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="hoogi.HoogiDAO"%>
<%@ page import="hoogi.Hoogi"%>
<%
	request.setCharacterEncoding("utf-8");

	String postnum = request.getParameter("postnum");
	HoogiDAO hdao = new HoogiDAO();
	Hoogi hl = hdao.getBoard(postnum);
	String ptitle = hl.getRtitle();
	String content = hl.getRcontent();
	

	
	
%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/partyboardstyle.css">
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="shortcut icon"
	href="http://simbyone.com/wp-content/uploads/2014/04/3455e6f65c33232a060c28829a49b1cb.png">

<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />

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

<script type="text/javascript" src="_scripts/login.js"></script>

</head>
<body>

	<%@include file="header.jsp"%>
	<script>
function del(){
	var result = confirm("자료를 삭제하시겠습니까?");
	if(result){
		location.href="del.jsp?postnum=<%=postnum%>";
	}else{
	}
}
function upd(){
	var result = confirm("자료를 수정하시겠습니까?");
	if(result){
		location.href="partyboard_writeUpd.jsp?postnum=<%=postnum%>&ptitle=<%=ptitle%>&content=<%=content%>&nick=<%=nick%>";
		} else {
		}
	}
</script>

	<nav>
		<img src="img\party.jpg" style="width: 100%; height: 100%;">
	</nav>
	<section>
		<!--         	<div id="wrap_"> -->
		<div id="board_bar" style="">
			<div id="board_box">
				<span id="review">
					<h1>게시판 글 보기</h1>
				</span>
			</div>
			<table class="table table-striped"
				style="border: solid 2px #EAEAEA; border-radius: 10px;">
				<thead>
					<tr>
						<th colspan="4" style="text-align: center;"><h2>[게시글]</h2></th>
					</tr>
				</thead>
				<tbody>


					<tr>
						<td
							style="border-right: solid 1px #EAEAEA; width: 15%; font-weight: 700;">글
							제목</td>
						<td style="width: 50%"><%=hl.getRtitle()%></td>
						<td
							style="border-right: solid 1px #EAEAEA; width: 15%; font-weight: 700;">닉네임</td>
						<td><%=hl.getNick()%></td>
					</tr>
					<tr>

						<td colspan="4" style="width: 200px; height: 350px;"><%=hl.getRcontent()%></td>

					</tr>




				</tbody>
			</table>
			<a href="partyboard.jsp"> <input type="button"
				class="btn btn-success" value="목록" style="margin-bottom: 50px;" /></a>

			<%if(nick.equals(nick)){%>
			<input type="button" onclick="upd()" class="btn btn-success"
				value="수정" style="margin-bottom: 50px;" /> <input type="button"
				onclick="del()" class="btn btn-success" value="삭제"
				style="margin-bottom: 50px;" />
			<%} %>


		</div>


	</section>
	<%@include file="footer.jsp"%>

</body>
</html>
