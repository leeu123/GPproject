<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/animated-header.css" />
<script type="text/javascript" src="slick-1.8.1/slick/slick.js"
	charset="utf-8"></script>

<script>
$(searchbar).keydown(function onEnterSubmit(){

var keyCode = window.event.keyCode;
if(keyCode==13) searchbar.submit();
});
</script>



</head>
<body>
	<% 
      String id ="id";
      String nick =null; 
     if(session.getAttribute("id")!=null&&session.getAttribute("nick")!=null){  //로그인이 되어있는지를 확인하기위해서 세션이 셋 되어 있으면 아이디 변수에 로그인된 아이디를 저장해둔다
	  id = (String)session.getAttribute("id");
	  nick = (String)session.getAttribute("nick");
      }
	  %>

	<header>
		<div id="header">
			<div id="header-inner" style="min-width: 1200px;">
				<div id="header-inner-logo">
					<div id="header-inner-logo-icon">
						<a href="gpindex.jsp"><img src="img\gplogo.png"
							id="logo-width"></a>

					</div>
					<form action="searchbar.do" method="post" name="searchbar">
					<input type="text" id="text-width" placeholder="지역, 식당 또는 음식"
						name="keyword_searchbar" onkeydown='javascript:onEnterSubmit()'>
				</form>

				</div>
				

				<div style="float: right; margin-top: 30px; margin-right: 35px;">
					<div class="dropdown">
						<a href="reviewList.bo"><div class="dropdown-button">리뷰
								게시판</div></a>
					</div>
					<div class="dropdown">
						<a href="boardList.bo"><div class="dropdown-button">Q&A</div></a>
					</div>
					<div class="dropdown">
						<div class="dropdown-button">파티모집</div>
						<div class="dropdown-content">
							<a href="party.jsp">진행중인 파티</a> <a href="party1.jsp">완료된 파티</a> <a
								href="partyregi.jsp">파티모집</a>


						</div>
					</div>
					<div class="dropdown">
						<div class="dropdown-button">맛집리스트</div>
						<div class="dropdown-content">
							<a href="masjib.jsp">내 맛집리스트</a>
						</div>
					</div>
					<%
				if (id == "id") { //로그인이 되지 않은 사람들만 이 화면이 보이도록 하기 위해서
		    	%>
					<div class="dropdown">
						<a href="loginpage.jsp"><div class="dropdown-button">로그인</div></a>
					</div>
					<%}else{ %>
					<div class="dropdown">
						<div class="dropdown-button">마이페이지</div>
						<div class="dropdown-content">
						<a href="mypage.jsp">회원 정보</a>
							
							<!-- 사업자 확인을 위해 business테이블에 동일한 아이디가 있으면 사업자 등록을 한거기 때문에 세션으로 등록한 아이디를 같이 보낸거 -->
							<a href="licensefind.bo?id=<%=id%>">식당등록</a> <a
								href="license.jsp">사업자등록</a> <a href="logoutAction.jsp">로그아웃</a>
						</div>
					</div>
					<%} %>


				</div>
			</div>
		</div>
	</header>

</body>
</html>
