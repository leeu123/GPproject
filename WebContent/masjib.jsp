<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>

#masjiplist li {padding-top:35px; padding-right:15px;margin:0;}
</style>


<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css"/>



<link rel="shortcut icon"
	href="http://simbyone.com/wp-content/uploads/2014/04/3455e6f65c33232a060c28829a49b1cb.png">
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic'>

<link rel="stylesheet" type="text/css" href="css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="css/animated-header.css" />


<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="_scripts/login.js"></script>




</head>
<body>
<%@include file = "header.jsp"%>
<div id="wrap_masjip" style="margin-top:100px; margin-bottom:100px; margin-left:340px;">
<ul id="masjiplist" style="list-style:none; width:1200px;">
<li><div id="masjipimg"><a href="masjiprec.jsp"><img src="img/avg_pyung.jpg"></a></div></li>  <!-- 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipviewtop.jsp"><img src="img/viewbest.jpg"></a></div></li> <!--  조회순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipkor.jsp"><img src="img/korbest.jpg"></a></div></li>  <!-- 한식 평점 순 맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipchn.jsp"><img src="img/chnbest.jpg"></a></div></li>  <!-- 중식 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipjpn.jsp"><img src="img/jpnbest.jpg"></a></div></li>  <!-- 일식 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipwest.jsp"><img src="img/westbest.jpg"></a></div></li>  <!-- 양식 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipworld.jsp"><img src="img/worldbest.jpg"></a></div></li>  <!-- 세계음식 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipwhat.jsp"><img src="img/whatbest.jpg"></a></div></li>  <!-- 뷔페 평점 순 맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipseoul.jsp"><img src="img/seoulbest.jpg"></a></div></li>  <!-- 서울 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipdj.jsp"><img src="img/daejeonbest.jpg"></a></div></li>  <!-- 대전 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipgj.jsp"><img src="img/gwangjubest.jpg"></a></div></li>  <!-- 광주 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipbs.jsp"><img src="img/busanbest.jpg"></a></div></li>  <!-- 부산 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipkk.jsp"><img src="img/kkbest.jpg"></a></div></li>  <!-- 경기 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipkw.jsp"><img src="img/kwbest.jpg"></a></div></li>  <!-- 강원 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipcb.jsp"><img src="img/cbbest.jpg"></a></div></li>  <!-- 충북 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipcn.jsp"><img src="img/cnbest.jpg"></a></div></li>  <!-- 충남 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipic.jsp"><img src="img/icbest.jpg"></a></div></li>  <!-- 인천 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipsj.jsp"><img src="img/sjbest.jpg"></a></div></li>  <!-- 세종 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipus.jsp"><img src="img/usbest.jpg"></a></div></li>  <!-- 울산 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipkn.jsp"><img src="img/knbest.jpg"></a></div></li>  <!-- 경남 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipkb.jsp"><img src="img/kbbest.jpg"></a></div></li>  <!-- 경북 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipdg.jsp"><img src="img/dgbest.jpg"></a></div></li>  <!-- 대구 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipjn.jsp"><img src="img/jnbest.jpg"></a></div></li>  <!-- 전남 인기맛집 top 10 -->
<li><div id="masjipimg"><a href="masjipjb.jsp"><img src="img/jbbest.jpg"></a></div></li>  <!-- 전북 인기맛집 top 10 -->

<li><div id="masjipimg"><a href="masjipjj.jsp"><img src="img/jjbest.jpg"></a></div></li>  <!-- 제주 인기맛집 top 10 -->

</ul>
</div>
<%@include file = "footer.jsp"%>
</body>
</html>
