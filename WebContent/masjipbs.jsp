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
<title>부산 인기 맛집 TOP 10</title>
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

	<div style="width: 100%; height: 86px;"></div>
	<article style="background-color: #eaeaea; text-align: center;">
		<h1 style="margin: 70px 0px 0px 0px; font-size: 1.5cm; color: black;">부산 인기 맛집 TOP 10</h1>
		<h3 style="color: #8C8C8C;">"부산이면 해산물이지"</h3>
	</article>
	<section style="background: #f6f6f6;">
		<div id="mat">
			<div
				style="width: 100%;  background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
				<div style="width: 50%;  margin: 0 auto;">
					<table style="width: 100%;">
						<%
							partyService ps = new partyService();    // partyService 객체 만들어 주기

							ArrayList<resdatDTO> rs = ps.selelistmasjipbs(request, response); // partyService에서 서울 맛집 10 list 뽑아서 list<resdatDTO> 에 넣기

							for (int i = 0; i < rs.size(); i++) {
								request.setAttribute("rnum", rs.get(i).getRnum());
								//DTO_AD rd = ps.seleRestau(request, response); // 식당번호를 통해서 식당정보 받아오는 문장
String color;
								
								if(rs.get(i).getAvg_pyung()==0){
									color = "gray";
								}
								else{
									color = "orange";
								}
								

								String file = rs.get(i).getFile();
								String[] array = file.split(",");

								List<String> list = new ArrayList<>();
								for (int k = 0; k < array.length; k++) {
									list.add(array[k]);
								}
						%>
						<tr style="border-top: solid 1px #eaeaea; height: 30px;">
							<td colspan="3"></td>
						</tr>

						<tr style="height: 30px;">
							<td rowspan="5" style="width: 220px;"><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><img
								src="restaurantUpload/<%=list.get(0)%>" width="200px;"
								height="180px"
								style="border-radius: 5px; border: solid 0.5px gray;"></a></td>
							<td align="left" ><a
								href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><div style="font-size: 0.59cm; color: #353535; font-weight: 600;">
									<%=(i + 1)%>.&nbsp;<%=rs.get(i).getStore()%><font color="<%=color%>">&nbsp;&nbsp;<%=rs.get(i).getAvg_pyung()%></font>
								</div></a></td>
								<td align="right"><img src="img/readcount.png" style ="width: 20px;"> &nbsp;<%= rs.get(i).getReadcount()%></td>
						</tr>
						<tr style="height: 30px;">
							<td align="left"><div style="color: #A6A6A6;" colspan="2">
									(<%=rs.get(i).getPostnum()%>)&nbsp;<%=rs.get(i).getHome()%><%=rs.get(i).getDethome()%></div></td>
						</tr>
						<tr style="height: 30px;" colspan="2">
							<% if(rs.get(i).getAvg_pyung()!=0.0){
						
						resdatDTO ra = ps.seleResdat(request, response);%>

							<td><b><%=ra.getNick()%></b>&nbsp;&nbsp;&nbsp;&nbsp;<%=ra.getDcontent()%></td><%}else{ %><td>해당 식당의 댓글이 아직 없습니다.</td><%} %>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr style="height: 30px;">
							<td style="width: 60%"></td>
							<td align="right"><a
								href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><h5
										style="color: #8C8C8C">식당 정보 보러가기&nbsp;&nbsp;></h5></a></td>
						</tr>
						<tr style="height: 30px;">
							<td colspan="3"></td>
						</tr>

						<%
							}
						%>
						<tr style="height: 50px;">
							<td colspan="3"></td>
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
        level: 9 // 지도의 확대 레벨
    };  

var map = new daum.maps.Map(mapContainer, mapOption); 

var geocoder = new daum.maps.services.Geocoder();
var listData = [
	<%for (int i = 0; i < rs.size(); i++) {
				request.setAttribute("rnum", rs.get(i).getRnum());
				DTO_AD rd = ps.seleRestau(request, response);%>
			
			
			'<%=rd.getHome()%>',
			<%}%>
];
var listStore=[
	
	<%for (int i = 0; i < rs.size(); i++) {
				request.setAttribute("rnum", rs.get(i).getRnum());
				DTO_AD rd = ps.seleRestau(request, response);%>
		
		
		'<%=rd.getStore()%>',
		<%}%>
	
];

var listRnum=[
	<%for (int i = 0; i < rs.size(); i++) {
				request.setAttribute("rnum", rs.get(i).getRnum());
				DTO_AD rd = ps.seleRestau(request, response);%>
		
		
		'<%=rd.getRnum()%>',
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
                content: '<div style="width:200px; text-align:center;padding:6px 0;"><a href="restaurantDetail.bo?rnum='+listRnum[index]+'">'+listStore[index]+': 식당보러가기</a>' + '</div>',
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
						<tr style="height:50px;"><td colspan="3"></td></tr>
					</table>
				</div>
			</div>
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
