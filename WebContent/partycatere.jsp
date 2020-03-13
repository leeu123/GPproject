<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="party.PartyDTO" %>
<%
	request.setCharacterEncoding("utf-8");
    ArrayList<PartyDTO> list = (ArrayList<PartyDTO>)request.getAttribute("list");
    request.setAttribute("sic",list);
%>

<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="css/partycate.css">
<link rel="stylesheet" type="text/css" href="css/gpstylepartycate.css">
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
	<section >
		<!--         	<div id="wrap_"> -->
		<div id="board_bar">
			<div id="board_box">
				<span id="review">
					<h1>[<%=list.get(0).getCate() %> 파티 게시판]</h1>
				</span>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th >번호</th>
						<th style="width: 50%;">제목</th>
						<th >예상금액</th>
						<th>주최자</th>
						<th>파티날짜</th>
					</tr>
				</thead>
				<tbody>

					<%
						for (int i = 0; i < list.size(); i++) { //
					%>

					<tr>
						<td><a
							href="partyinfore.do?pnum=<%=list.get(i).getPnum()%>"><%=(list.size()-i)%></a></td>
						<td><a
							href="partyinfore.do?pnum=<%=list.get(i).getPnum()%>"><%=list.get(i).getTitle()%></a></td>
						<td><a
							href="partyinfore.do?pnum=<%=list.get(i).getPnum()%>"><%=list.get(i).getPreprice()%></a></td>
						<td><a
							href="partyinfore.do?pnum=<%=list.get(i).getPnum()%>"><%=list.get(i).getNick()%></a></td>	
						<td><a
							href="partyinfore.do?pnum=<%=list.get(i).getPnum()%>"><%=list.get(i).getPdate()%></a></td>
					</tr>

					<%
						}
					%>

				</tbody>
			</table>
			<div id="paging_bar">
		<!-- 페이징 코드 자리 -->
			</div>
			<div id="paging_bar" style="text-align:center;">
				<div id="board_serch">
					<select name="spick">
						<option value="제목">제목</option>
						<option value="작성자">주최자</option>
					</select> <input type="text" name="board_text" /> <input type="button"
						name="board_button" value="검색" />
						<%if((String)session.getAttribute("id")!=null){ %><a href="partyregi.jsp"><input type="button" class="btn btn-success" value="파티 모집"></a><%} %>
				</div>
				
				
			</div>

		</div>

	</section>
	<%@include file="footer.jsp"%>

</body>
</html>
