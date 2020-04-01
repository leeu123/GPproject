<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.*"%>


<head>
<title>Party Apply</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/gpstylepartyapply.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/apply_success.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="css/animated-header.css" />
<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="_scripts/login.js"></script>
<script type="text/javascript" src="scripts/party.js"></script>
<script>
</script>
</head>
<body>
	<%@include file="header.jsp"%>

	<div style="width: 100%; height: 86px;"></div>
	<article></article>
	<section style="background: #f6f6f6;">
		<div style="width: 55%; height: 100%; background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
		
		<%  String store = request.getParameter("rname");
		String addre = request.getParameter("addr");%>
		
		<table style="width:80%; margin:0 auto;">
		<tbody>
		<tr><td style="font-family: 'Noto Sans KR', sans-serif; font-size:1cm;">Congraturation!</td></tr>
		<tr >
		<td style="font-family: 'Noto Sans KR', sans-serif; font-size:0.8cm;">
		 파티 신청이 완료되었습니다.		
		</td>
		</tr>
		<tr><td style="height:20px;"></td></tr>
		</tbody>
		<tbody style="font-family: 'Noto Sans KR', sans-serif; border-top:solid 3px #35B62C;border-bottom:solid 3px #35B62C; height:400px; font-size:0.5cm;">
		<tr><td style="height:50px;"> 파티 식당 주소를 확인해 주시기 바랍니다.</td></tr>
		<tr><td style=" font-family: 'Noto Sans KR', sans-serif; font-size:0.5cm;">
		<div id="map" style="height: 250px; margin: 0; width: 100%">
						<!-- * 카카오맵 - 지도퍼가기 -->
						<!-- 1. 지도 노드 -->
						<div style="width: 600px;"></div>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf5b09f6a8ad0eb6b151ed60b7c9af99&libraries=services"></script>
						<input type="hidden" name="home" id="home"
							value="<%=addre %>"> <input type="hidden"
							name="store" id="store" value="<%=store%>">

						<script>
							var add = document.getElementById('home').value
							var store = document.getElementById('store').value
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							//지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							//주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							//주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											add,
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																		+ store
																		+ '</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						</script>

					</div>
		</td></tr>
		<tr><td style="height:50px;"></td></tr>

		</tbody>
		<tfoot>
		<tr><td style="height:50px;"></td></tr>
		<tr><td style="text-align:center;"> 	<a href="gpindex.jsp"><button type="button" class="btn btn-success">홈으로</button></a>
		<a href="party.jsp"><button type="button" class="btn btn-success">파티 창으로</button></a>	</td></tr>
		
		</tfoot>
		
		</table>
		


		
	
		 
			

			
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
