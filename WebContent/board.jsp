<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>


<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="css/boardstyle.css">
<link rel="stylesheet" type="text/css" href="css/gpstyleboard.css">
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

<!-- 지역 버튼을 누르면 submit 작업을 하기위한 코드 -->
<script>
	function gogo() {

		document.location.submit();
	}
</script>

<style>
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
	height: 20px;
}
</style>
</head>
<body>


	<%@include file="header.jsp"%>

	<%
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		int listCount = pageInfo.getListCount();
		int nowPage = pageInfo.getPage();
		int maxPage = pageInfo.getMaxPage();
		int startPage = pageInfo.getStartPage();
		int endPage = pageInfo.getEndPage();
	%>

	<%
		int pageNumber = 1; //1 이라는 것은 기본 적으로 1페이지를 의미하는거에요 무슨 페이지든 1페이지는 있으닌까
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라디터는 이런식으로 타입을 변경시켜주는 함수를 사용해야한다.

		}
	%>

	<nav style="height:auto;">
		<img src="img\board_nav_img.jpg" style="width: 100%">
	</nav>
	<section style="min-height: 620px; width: 100%; margin-bottom: 30px;">
		<div id="board_bar">
			<div id="board_box">
				<span id="review"><h1>리뷰 게시판</h1></span>
			</div>
			<div id="board_box">
				<form method="post" action="reviewLocalSearch.bo" name="location">
					<ul style="padding-left: 0px">
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="서울"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="경기"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="인천"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="강원"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="대전"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="충남"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="충북"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="세종"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="부산"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="울산"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="경남"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="경북"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="대구"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="광주"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="전남"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="전북"></li>
						<li><input type="submit" onClick="gogo()"
							class="btn btn-success" name="local" value="제주"></li>
					</ul>
				</form>
			</div>


			<table class="table table-striped">
				<thead>


					<tr>
						<th style="width: 6%;">번호
						</td>
						<th style="width: 60%;">제목
						</td>
						<th>작성자
						</td>
						<th>지역
						</td>
						<th>날짜
						</td>
						<th>조회수
						</td>

					</tr>

				</thead>
				<tbody>
					<!--================ 제목, 작성자, 위치로 검색한 정보가 없을경우 전체 정보가 보이도록 하기위한 조건문=================================================  -->
					<%
						ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>) request.getAttribute("articleList");
						ArrayList<ReviewBean> searchList = (ArrayList<ReviewBean>) request.getAttribute("searchList");
					%>

					<%
						if (articleList != null) {
							for (int i = 0; i < articleList.size(); i++) {
					%>
					<tr>
						<td><%=articleList.get(i).getRnum()%></td>

						<td><a
							href="reviewDetail.bo?board_num=<%=articleList.get(i).getRnum()%>&page=<%=nowPage%>">
								<%=articleList.get(i).getRtitle()%>
						</a></td>

						<td><%=articleList.get(i).getNick()%></td>
						<td><%=articleList.get(i).getLocation()%></td>
						<td><%=articleList.get(i).getDate()%></td>
						<td><%=articleList.get(i).getReadcount()%></td>
					</tr>
					<%
						}
						} else if (searchList != null) {
							for (int i = 0; i < articleList.size(); i++) {
					%>
					<tr>
						<td><%=searchList.get(i).getRnum()%></td>

						<td><a
							href="reviewDetail.bo?board_num=<%=searchList.get(i).getRnum()%>">
								<%=searchList.get(i).getRtitle()%>
						</a></td>

						<td><%=searchList.get(i).getNick()%></td>
						<td><%=searchList.get(i).getLocation()%></td>
						<td><%=searchList.get(i).getDate()%></td>
						<td><%=searchList.get(i).getReadcount()%></td>
					</tr>
					<%
						}
						}
					%>

					</div>
				</tbody>
			</table>

			<section
				style="margin: auto; width: 500px; text-align: center; height: 20px;">

				<%
					if (nowPage <= 1) {
				%>

				<button class="btn btn-success">이전</button>
				&nbsp;
				<%
					} else {
				%>

				<a href="reviewList.bo?page=<%=nowPage - 1%>"><button
						class="btn btn-success">이전</button></a> &nbsp;
				<%
					}
				%>

				<%
					for (int a = startPage; a <= endPage; a++) {
						if (a == nowPage) {
				%>
				<button class="btn btn-success"><%=a%></button>
				<%
					} else {
				%>
				<a href="reviewList.bo?page=<%=a%>">
					<button class="btn btn-success"><%=a%></button>
				</a>&nbsp;
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (nowPage >= maxPage) {
				%>
				<button class="btn btn-success">다음</button>
				<%
					} else {
				%>
				<a href="reviewList.bo?page=<%=nowPage + 1%>"><button
						class="btn btn-success">다음</button></a>
				<%
					}
				%>

			</section>

			<div style="margin: auto; width: 500px; text-align: center; height: 20px;position : relative;top : 30px">

				<form method="post" action="reviewSearchList.bo">
					<select name="searchvalues" id="searchvalues">
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select> <input type="text" name="keyword"> <input type="submit"
						name="search_button" value="검색">
				</form>
				<%
					if (id != "id") {
				%>
				<a href="reviewWriteForm.bo"><button type="button"
						class="btn btn-success" id="write_button"
						style="position: relative; left: 180px; top: -43px;">글작성</button>
				</a>
				<%
					}
				%>


			</div>
	</section>





	<%@include file="footer.jsp"%>

</body>
</html>
