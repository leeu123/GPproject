<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<head>
<title>GreenPlate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link rel="stylesheet" type="text/css" href="css/gpstyle2.css">
<link rel="stylesheet" type="text/css" href="css/menubar.css">
<link rel="stylesheet" type="text/css" href="css/gp.css" />
<link rel="stylesheet" type="text/css" href="slick-1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick-1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="css/loginstyle.css"/>

<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
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

<script type="text/javascript" src="slick-1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="slick-1.8.1/slick/slick.js" charset="utf-8"></script>
<script type="text/javascript" src="_scripts/login.js"></script>



</head>
<body>

	<%@include file = "header.jsp"%>
	<nav>

		<%@include file = "nav.jsp"%>
	</nav>

	<div id="wrap_">
		<div id="slider1" style="margin:30px 5% 30px 5%; width:90%; border-top:solid 1px #d5d5d5;">
		<table style="width:100%;"><tbody><tr><td width="50%"><p style="margin:30px 0 0 40px;  font-size:0.5cm; font-weight:900; color:#1D8B15; opacity:0.8;"> 믿고 보는 맛집 리스트 </p></td>
		<td width="50%"><p style="margin:30px 0 0 70px; text-align:right; font-size:0.4cm;"> <a href="masjib.jsp" style="font-weight:700; opacity:0.6; text-decoration: underline;;">리스트 더보기</a></p></td></tr></tbody></table>
			<div class="list" style="margin-bottom:10px;">
			
			<div >
					<a href="masjiprec.jsp"><img src="img/avg_pyung1.jpg"></a> <!--  평점순 베스트 10 -->
				</div>
					<div>
					<a href="masjipkor.jsp"><img src="img/viewbest1.jpg"></a> <!--  조회수 베스트 10 -->
				</div>

				<div>
					<a href="masjipkor.jsp"><img src="img/korbest1.jpg"></a> <!--  한식 베스트 10 -->
				</div>

				<div>
					<a href="masjipchn.jsp"><img src="img/chnbest1.jpg"></a> <!--  중식 베스트 10 -->
				</div>

				<div>
					<a href="masjipjpn.jsp"><img src="img/jpnbest1.jpg"></a> <!--  일식 베스트 10 -->
				</div> 

				<div>
					<a href="masjipwest.jsp"><img src="img/westbest1.jpg"></a> <!--  양식 베스트 10 -->
				</div>
				
				<div>
					<a href="masjipworld.jsp"><img src="img/worldbest1.jpg"></a> <!--  세계음식 베스트 10 -->
				</div>
				
				<div>
					<a href="masjipwhat.jsp"><img src="img/whatbest1.jpg"></a> <!--  뷔페 베스트 10 -->
				</div>

				
				

			

				<div>
					<a href="masjipseoul.jsp"><img src="img/seoulbest1.jpg"></a> <!--  서울 맛집 베스트 10 -->
				</div>

				<div>
					<a href="masjipdj.jsp"><img src="img/daejeonbest1.jpg"></a><!--  대전 맛집 베스트 10 -->
				</div>

				<div>
					<a href="masjipgj.jsp"><img src="img/gwangjubest1.jpg"></a><!--  광주 맛집 베스트 10 -->
				</div>
				
				<div>
					<a href="masjipbs.jsp"><img src="img/busanbest1.jpg"></a><!--  부산 맛집 베스트 10 -->
				</div>
				

			</div>
			<script type="text/javascript">
				$('.list').slick({
					dots:true,
					infinite : true,
					slidesToShow : 4,
					slidesToScroll : 4,
					autoplay: true,
                    autoplaySpeed: 3000

				});
			</script>
		</div>
		<div id="slider2" style="margin:30px 5% 30px 5%; width: 90%; border-top:solid 1px #d5d5d5;">
		<table style="width:100%;"><tbody><tr><td width="50%"><p style="margin:30px 0 0 40px; font-size:0.5cm; font-weight:900; color:#1D8B15; opacity:0.8;"> 믿고 신청하는 신나는 파티</p></td>
		<td width="50%"><p style="margin:30px 0 0 70px; text-align:right; font-size:0.4cm;"> <a href="party.jsp" style="font-weight:700; opacity:0.6; text-decoration: underline;">진행중인 파티 보러가기</a></p></td></tr></tbody></table>
			<div class="party">
				<div>
					<a href="partycate.do?cate=한식"><img src="img/koreaP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=중식"><img src="img/chinaP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=일식"><img src="img/japanP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=양식"><img src="img/westernP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=세계음식"><img src="img/worldP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=뷔페"><img src="img/whateverP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=한식"><img src="img/koreaP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=중식"><img src="img/chinaP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=일식"><img src="img/japanP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=양식"><img src="img/westernP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=세계음식"><img src="img/worldP.jpg"></a>
				</div>
				
				<div>
					<a href="partycate.do?cate=뷔페"><img src="img/whateverP.jpg"></a>
				</div>

				

			</div>
			<script type="text/javascript">
				$('.party').slick({
					dots:true,
					infinite : true,
					slidesToShow : 4,
					slidesToScroll : 4,
					autoplay: true,
                    autoplaySpeed: 3000

				});
			</script>
		</div>




		<%@include file = "footer.jsp"%>



	</div>
</body>

</html>
