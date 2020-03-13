<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo_party"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="model.DTO "%>
<html lang="en">
<head>
<style>
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
	height : 30px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/boardstyle.css">
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

	<%
	ArrayList<DTO> list = (ArrayList<DTO>)request.getAttribute("data");
	 PageInfo_party pageInfo = (PageInfo_party)request.getAttribute("pageInfo");
		int listCount=pageInfo.getListCount();
		int nowPage=pageInfo.getPage();
		int maxPage=pageInfo.getMaxPage();
		int startPage=pageInfo.getStartPage();
		int endPage=pageInfo.getEndPage();
		
	
   %>

	<%
	    
		String login_id = null;
		String nic = null;
		if (session.getAttribute("id") != null) { //로그인이 되어있는지를 확인하기위해서 세션이 셋 되어 있으면 아이디 변수에 로그인된 아이디를 저장해둔다
			login_id = (String) session.getAttribute("id");
		}
		
	%>

	<nav>
		<img src="img\board_nav_img.jpg" style="width: 100%">
	</nav>
	<section style="min-height: 649px; height : 649px;">
		<div id="board_bar">
			<div id="board_box">
				<span id="review"><h1>일식 파티정보</h1></span>
			</div>

			<table class="table table-striped">
				<thead>
					<%
if(list != null && listCount > 0){
%>

					<tr>
						<th style="width: 6%;">번호
						</td>
						<th style="width: 60%;">제목
						</td>
						<th style="width: 10%;">주최자
						</td>
						<th>금액
						</td>
						<th>날짜
						</td>

					</tr>

				</thead>
				<tbody>


					<%
		for(int i=0;i<list.size();i++){
			
	%>
					<tr>
						<td><%=list.get(i).getPnum()%></td>

						<td><a
							href="sang.do?command=detail&pnum=<%=list.get(i).getPnum()%>">
								<%=list.get(i).getTitle()%>
						</a></td>

						<td><%=list.get(i).getName()%></td>
						<td><%=list.get(i).getPreprice() %></td>
						<td><%=list.get(i).getPdate() %></td>
					</tr>
					<%
						}
					%>


				</tbody>
			</table>
			
			<section id="pageList">
				<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="sang.do?command=select&page=<%=nowPage-1 %>">[이전]</a>&nbsp;
				<%} %>

				<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="sang.do?command=select&page=<%=a %>">[<%=a %>]
				</a>&nbsp;
				<%} %>
				<%} %>

				<%if(nowPage>=maxPage){ %>
				[다음]
				
				<%}else{ %>
				<a href="sang.do?command=select&page=<%=nowPage+1 %>">[다음]</a>
				<%} %>
				
							
			</section>
           <div id="pageList">

				<select>
					<option>제목</option>
					<option>작성자</option>
				</select> <input type="text" name="board_text"> <input type="button"
					name="board_button" value="검색"> <a href="partyregi.jsp">
					<%
							if (id != null) {
						%>
					<button type="button" class="btn btn-success" id="write_button">글작성</button>
				</a>
				<%
						}
					%>
           

			
	</section>

	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
							if (id != null) {
						%>
	<a href="partyregi.jsp"><button type="button"
			class="btn btn-success" id="write_button">글작성</button></a>
	<%
	}
	}
%>
	<%@include file="footer.jsp"%>

</body>
</html>
