<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<style>
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
	height : 20px;
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
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
   %>

	<nav>
		<img src="img\board_nav_img.jpg" style="width: 100%;">
	</nav>
	<section style="min-height: 649px; width: 100%; padding-bottom: 30px;">
		<div id="board_bar">
			<div id="board_box">
				<span id="review"><h1>Q&A 게시판</h1></span>
			</div>

			<table class="table table-striped">
				<thead>
					<%
if(articleList != null && listCount > 0){
%>

					<tr>
						<th style="width: 6%;">번호
						</th>
						<th style="width: 60%;">제목
						</th>
						<th>작성자
						</th>
						<th>날짜
						</th>
						<th>조회수
						</th>

					</tr>

				</thead>
				<tbody>


					<%
		for(int i=0;i<articleList.size();i++){
			
	%>
					<tr>
						<td><%=articleList.get(i).getQnum()%></td>

						<td>
							<%if(articleList.get(i).getQlev()!=0){ %> <%for(int a=0;a<=articleList.get(i).getQlev()*2;a++){ %>
							&nbsp; <%} %> <%}else{ %> <%} %> <a
							href="boardDetail.bo?board_num=<%=articleList.get(i).getQnum()%>&page=<%=nowPage%>&id=<%=id%>">
								<%=articleList.get(i).getQtitle()%>
						</a>
						</td>

						<td><%=articleList.get(i).getNick()%></td>
						<td><%=articleList.get(i).getDate() %></td>
						<td><%=articleList.get(i).getReadcount() %></td>
					</tr>
					<%
						}
					%>


				</tbody>
			</table>
			<div id="pageList">
				<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
				<%} %>

				<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="boardList.bo?page=<%=a %>">[<%=a %>]
				</a>&nbsp;
				<%} %>
				<%} %>

				<%if(nowPage>=maxPage){ %>
				[다음]
				<%}else{ %>
				<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
				<%} %>
			</div>


			<div id="pageList">

				<form method="post" action="boardSearchList.bo">
					<select name="searchvalues" id="searchvalues">
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select> <input type="text" name="keyword"> <input type="submit"
						name="search_button" value="검색">
				</form>
				<%
							if (id != "id") {
						%>
				<a href="boardWriteForm.bo"><button type="button"
						class="btn btn-success" id="write_button"
						style="position: relative; left: 180px; top: -43px;">글작성</button>
				</a>
				<%
						}
					%>


			</div>

			<%
    }
	else
	{
	%>
			<div id="emptyArea">등록된 글이 없습니다.</div>
			<%
							if (id != "id") {
						%>
			<a href="boardWriteForm.bo"><button type="button"
					class="btn btn-success" id="write_button"
					style="position: relative; left: 180px; top: -43px;">글작성</button></a>
			<%
	}
	}
%>
		</div>
	</section>
	<%@include file="footer.jsp"%>

</body>
</html>
