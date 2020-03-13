<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="vo.ReviewBean"%>

<%
	ReviewBean article = (ReviewBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
%>

<html lang="en">
<head>
<meta http-equiv="Content-Tpye" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" minitial-scale="1">
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

	<nav>
		<img src="img\board_nav_img.jpg" style="width: 1900px">
	</nav>
	<section id="review_detail_view_section">
		<div
			id="review_detail_view_total_bar">
			<div id = "review_detail_view_imgtotal_bar">
				<%
					String file = article.getRfile();
					String[] array = file.split(",");

					ArrayList<String> list = new ArrayList<String>();
					for (int i = 0; i < array.length; i++) {
						list.add(array[i]);
					}
					for (int s = 0; s < list.size(); s++) {
				%>
				<div
					id="review_detail_view_img_bar">
					<img src="boardUpload/<%=list.get(s)%>" id = "review_detail_view_img">
				</div>
				<%
					}
				%>

				<div
					id="review_detail_view_title_total_bar">
					<div
						id="review_detail_view_title">
						제목 :
						<%=article.getRtitle().replaceAll("", "&nbsp").replaceAll("<", "&gt").replaceAll(">", "&gt")%></div>
					<span
						id="review_detail_view_writer">
						작성자 :
						<%=article.getNick()%></span>
					<span
						id="review_detail_view_redcount">
						<img src="img/readcount.png" style="width: 20px;"> &nbsp;
						<%=article.getReadcount()%>
					</span>
					<div
						id="review_detail_view_rcontent_bar">
						<div id="review_detail_view_rcontent"><%=article.getRcontent().replaceAll("", "&nbsp").replaceAll("<", "&gt").replaceAll(">", "&gt")%></div>
					</div>
						
				<%
					if (id != "id") {
				
			  %>
			  <div style ="position : relative; top : 12px">
			<a class="btn btn-success" style="color: white"
			href="reviewModifyForm.bo?board_num=<%=article.getRnum() %>">
			수정 </a> <a class="btn btn-success" style="color: white"
			href="reviewDeleteForm.bo?board_num=<%=article.getRnum() %>&page=<%=nowPage%>">
			삭제 </a> <a href="reviewList.bo?page=<%=nowPage%>" class="btn btn-success" style="color: white">목록</a>&nbsp;&nbsp;
			</div>
				<%
					}
				%>
					<div
						id="review_detail_view_date"><%=article.getDate()%></div>

				</div>

			</div>
			

		</div>

	</section>
	<%@include file="footer.jsp"%>
</body>
</html>



