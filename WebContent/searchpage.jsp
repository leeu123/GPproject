<%@page import="java.lang.reflect.Parameter"%>
<%@page import="controll.partyService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="party.*"%>
<%@ page import="resdat.*"%>
<%@ page import="restaurant.*"%>
<%@ page import="vo.*"%>


<head>
<title>2020 한식 베스트 10</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gpstylemasjip.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/masjip.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<script>
	
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<nav>
		<%@include file="nav.jsp"%>
	</nav>

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


	<%
		ArrayList<DTO_AD> articleList = (ArrayList<DTO_AD>) request.getAttribute("articleList");
		String[] navloca = (String[]) request.getAttribute("navloca");
		String[] navtype = (String[]) request.getAttribute("navtype");
		String[] navprice = (String[]) request.getAttribute("navprice");
		session.setAttribute("navloca", navloca);
		session.setAttribute("navprice", navprice);
		session.setAttribute("navtype", navtype);
	%>




	<section style="background: #f6f6f6;">
		<div id="mat">
			<div
				style="width: 100%; background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
				<div style="width: 50%; margin: 0 auto;">
					<table style="width: 100%;">
						<%
							for (int i = 0; i < articleList.size(); i++) {
								String file = articleList.get(i).getFile();
								String[] array = file.split(",");
								List<String> list = new ArrayList<>();
								for (int i2 = 0; i2 < array.length; i2++) {
									list.add(array[i2]);
								}
								String color;

								if (articleList.get(i).getAvg_pyung() == 0) {
									color = "gray";
								} else {
									color = "orange";
								}
						%>
						<tr style="border-top: solid 1px #eaeaea; height: 30px;">
							<td colspan="3"></td>
						</tr>
						<tr style="height: 30px;">
							<td rowspan="5" style="width: 220px;"><img
								src="restaurantUpload/<%=list.get(0)%>" width="200px;"
								height="180px"
								style="border-radius: 5px; border: solid 0.5px gray;"></td>
							<td align="left"><div
									style="font-size: 0.59cm; color: #353535; font-weight: 600;">
									<%=(i + 1)%>.&nbsp;<%=articleList.get(i).getStore()%><font
										color="<%=color%>">&nbsp;&nbsp;<%=articleList.get(i).getAvg_pyung()%></font>
								</div></td>
							<td align="right"><img src="img/readcount.png"
								style="width: 20px;"> &nbsp;<%=articleList.get(i).getReadcount()%></td>
						</tr>
						<tr style="height: 30px;">
							<td align="left"><div style="color: #A6A6A6;" colspan="2">
									(<%=articleList.get(i).getPostnum()%>)&nbsp;<%=articleList.get(i).getHome()%><%=articleList.get(i).getDethome()%></div></td>
						</tr>
						<tr style="height: 30px;" colspan="2">
							<%
								if (articleList.get(i).getAvg_pyung() != 0.0) {
							%>

							<td><b><%=articleList.get(i).getNick()%></b>&nbsp;&nbsp;&nbsp;&nbsp;<%=articleList.get(i).getDcontent()%></td>
							<%
								} else {
							%><td>해당 식당의 댓글이 아직 없습니다.</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr style="height: 30px;">
							<td style="width: 60%"></td>
							<td align="right"><a
								href="restaurantDetail.bo?rnum=<%=articleList.get(i).getRnum()%>"><h5
										style="color: #8C8C8C">식당 정보 보러가기&nbsp;&nbsp;></h5></a></td>
						</tr>
						<tr style="height: 30px;">
							<td colspan="3"></td>
						</tr>


						<tr style="height: 50px;">
							<td colspan="3"></td>
						</tr>


						<%
							}
						%>
						<tr style="height: 50px;">
							<td colspan="3">
								<section id="pageList" style = "text-align: center;">

									<%
										if (nowPage <= 1) {
									%>

									<button class="btn btn-success">이전</button>
									&nbsp;
									<%
										} else {
									%>

									<a href="navsearch2.do?page=<%=nowPage - 1%>"><button
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
									<a href="navsearch2.do?page=<%=a%>">
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
									<a href="navsearch2.do?page=<%=nowPage + 1%>"><button
											class="btn btn-success">다음</button></a>
									<%
										}
									%>

								</section>
							</td>
						</tr>

						<tr>
							<td colspan="3">
								<div id="map" style="width: 100%; height: 350px;"></div> <script
									type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc6482c1e6b50e49081ffcb92798d694&libraries=services"></script>

								<script>

	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

var map = new daum.maps.Map(mapContainer, mapOption); 

var geocoder = new daum.maps.services.Geocoder();


var listData = [
	
	<%for (int i = 0; i < articleList.size(); i++) {%>
	
	
	'<%=articleList.get(i).getHome()%>',
	<%}%>
		
];
var listStore=[
	<%for (int i = 0; i < articleList.size(); i++) {%>
		
		
		'<%=articleList.get(i).getStore()%>',
		<%}%>
	

];

var listRnum=[
	<%for (int i = 0; i < articleList.size(); i++) {%>
		
		
		'<%=articleList.get(i).getRnum()%>',
		<%}%>
		
	
];

										
listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:200px; height:text-align:center;padding:6px 0;">' + listStore[index] +':<a href="restaurantDetail.bo?rnum='+listRnum[index]+'">식당보러가기</a>' + '</div>',
                disableAutoPan: true
                
            });
            marker.setMap(map);
            
            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                  // 마커 위에 인포윈도우를 표시합니다
                  infowindow.open(map, marker);  
            });
            
            
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });
});

</script>



							</td>
						</tr>

						<tr style="height: 50px;">
							<td colspan="3"></td>
						</tr>
					</table>


				</div>
			</div>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
