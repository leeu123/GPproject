<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="hoogi.HoogiDAO"%>
<%@ page import="hoogi.Hoogi"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int pagenumber = 1;
	if (request.getParameter("pagenumber") != null) {
		pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
	}
%>
<%
		String login_id = null;
		
		if (session.getAttribute("id") != null) { //로그인이 되어있는지를 확인하기위해서 세션이 셋 되어 있으면 아이디 변수에 로그인된 아이디를 저장해둔다
			login_id = (String) session.getAttribute("id");
		}
		
	%>

<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="css/partyboardstyle.css">
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
<style>
#pagenext a:active {
	font-weight: 900;
	font-size: 15px;
}
</style>
</head>
<body>

	<%@include file="header.jsp"%>

	<nav>
		<img src="img\party.jpg" style="width: 100%; height: 100%;">
	</nav>
	<section style="min-height: 649px">
		<!--         	<div id="wrap_"> -->
		<div id="board_bar">
			<div id="board_box">
				<span id="review">
					<h1>파티 후기 게시판</h1>
				</span>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th  style = "width: 5%">번호</th>
						<th style="width: 60%;">제목</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>

					<%
						HoogiDAO hdao = new HoogiDAO();
						ArrayList<Hoogi> hl = hdao.getList(pagenumber);
						for (int i = 0; i < hl.size(); i++) { //
					%>

					<tr>
						<td><a
							href="partyboardview.jsp?postnum=<%=hl.get(i).getRpostnum()%>"><%=hl.get(i).getRpostnum()%></a></td>
						<td><a
							href="partyboardview.jsp?postnum=<%=hl.get(i).getRpostnum()%>"><%=hl.get(i).getRtitle()%></a></td>
						<td><a
							href="partyboardview.jsp?postnum=<%=hl.get(i).getRpostnum()%>"><%=hl.get(i).getNick()%></a></td>	
						<td><a
							href="partyboardview.jsp?postnum=<%=hl.get(i).getRpostnum()%>"><%=hl.get(i).getDate().substring(0, 11) + hl.get(i).getDate().substring(11, 13) + "시"
						+ hl.get(i).getDate().substring(14, 16) + "분"%></a></td>
					</tr>

					<%
						}
					%>

				</tbody>
			</table>
				<div id="board_serch">
					<select>
						<option>제목</option>
						<option>작성자</option>
					</select> <input type="text" name="board_text"> <input type="button"
						name="board_button" value="검색"> <a href="partyboard_write.jsp">
						<%
							if (id != null) {
						%>
						<button type="button" class="btn btn-success" id="write_button">글작성</button>
					</a>
					<%
						}
					%>
				

			</div>

	</section>
	<%@include file="footer.jsp"%>

</body>
</html>
