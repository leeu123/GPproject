<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="restaurant.*"%>
<%@ page import="resdat.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="controll.partyService" %>

<%
	request.setCharacterEncoding("utf-8");
	int rnum1 = Integer.parseInt(request.getParameter("rnum"));
	

	ArrayList<DTO_AD> rest;
	resdatDAO rd = new resdatDAO();
	Double avg_pyung = rd.getPyung(rnum1);
	restaurantDAO red = new restaurantDAO();
	DTO_AD restau = red.getRestaurant(rnum1);
%>


<head>
<title>Restaurant</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gpstylerestau.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/restaurant.css" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic'>

<link rel="stylesheet" type="text/css" href="css/Icomoon/style.css" />
<link rel="stylesheet" type="text/css" href="css/animated-header.css" />

<script type="text/javascript" src="_scripts/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="_scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="_scripts/jquery.isotope.min.js"></script>
<script type="text/javascript" src="_scripts/animated-header.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="_scripts/login.js"></script>
<script>


function reservation() {
	var id = this.id.value;
	var rnum = this.rnum1.value;
	var cheres = this.cheres.value;
	var idrest = this.idrest.value;
	
	if (id == "id") {
		alert("로그인이 필요합니다.");
		location.href = "loginpage.jsp";
	}
	else if(id==idrest){
		alert("식당 주인은 신청하지 못합니다.")
	}
	else if(cheres != "null"){
		alert("이미 예약하신 식당입니다.")
	}
	else {
		window.open("reservation.jsp?rnum="+rnum+"&id="+id+"&store="+restaurant.store.value+"&postnum="+this.postnum.value+"&home="+restaurant.home.value+"&dethome="+this.dethome.value+"&parking="+this.parking.value+"&cell="+this.cell.value, "reser",
		"width=650,height=570");  // 새창을 띄워주는 코드 사이즈 지정과 함께
		
	}
}

function rescancel(){
	var result = confirm(
      "아이디 : " + this.id.value+
      "\n식당이름 : "+ restaurant.store.value+
      "\n예약날짜 : "+ this.rresdate.value+
      "\n예약시간 : " + this.rrestime.value+
      "\n\n예약 취소하시겠습니까?"	);
	
	if(result){
		location.href="rescancel.jsp?id="+this.id.value+"&rnum="+this.rnum1.value;
	}
	
	
}
	//=================입력 Ajax
	function datdung() {
		if (id == "id") {
			alert("로그인이 필요합니다.");
		} else if (restaurant.dcontent.value == "") {
			alert("댓글을 입력하여주십시오.");
		} else {
			callAjax();
		}
	}
	
	function callAjax() {
		$.ajax({
			type : "post",
			url : "./resdat.jsp",
			data : {
				rnum : $('#rnum1').val(),
				dcontent : $('#dcontent').val(),
				id : $('#id').val(),
				nick : $('#nick').val(),
				pyung : $('#pyung').val()
			},
			success : whenSuccess,
			error : whenError
		});
	}
	function whenSuccess(resdata) {
		alert("댓글이 입력되었습니다.");
		$("#datgul").html(resdata);
		$('#dcontent').val("");
		$('#pyung').val("1");
	}
	function whenError() {
		alert("Error");
	}
	//=================평가별 정렬 Ajax
	function callAjaxP(s) {
		$.ajax({
			type : "post",
			url : "./resdatP.jsp",
			data : {
				pyung : s,
				rnum : $('#rnum1').val()
			},
			success : whenSuccessP,
			error : whenErrorP
		});
	}
	function whenSuccessP(resdata) {
		$("#datgul").html(resdata);
	}
	function whenErrorP() {
		alert("Error");
	}
	//=================전체 정렬 Ajax
	function callAjaxALL() {
		$.ajax({
			type : "post",
			url : "./resdat2.jsp",
			data : {
				rnum : $('#rnum1').val()
			},
			success : whenSuccessALL,
			error : whenErrorALL
		});
	}
	function whenSuccessALL(resdata) {
		$("#datgul").html(resdata);
	}
	function whenErrorALL() {
		alert("Error");
	}
</script>
</head>
<body>



	<%@include file="header.jsp"%>
	<%
		DTO_AD article = (DTO_AD) request.getAttribute("article");
		String nowPage = (String) request.getAttribute("page");
		
		
		request.setAttribute("rnum", rnum1);
		request.setAttribute("id",id);
		partyService ps = new partyService();  // 예약한지 확인하는 호출
		String idrest = ps.idrest(request, response);
		reservationDTO s =ps.checkReser(request, response); // 예약한지 확인하는 호출
		
	%>


	<section>

		<div style="width: 1920px;">


			<%String file =article.getFile();
		String[] array = file.split(",");
		 
		List<String> list = new ArrayList<>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		} %>

			<div style="width: 1920px; height: 350px; margin-top: 30px;">

				<div style="width: 380px; height: 350px; display: inline-block;">
					<img src="restaurantUpload/<%=list.get(0)%>" width="375px"
						height="350px">
				</div>
				<div style="width: 380px; height: 350px; display: inline-block;">
					<img src="restaurantUpload/<%=list.get(1)%>" width="375px"
						height="350px">
				</div>
				<div style="width: 380px; height: 350px; display: inline-block;">
					<img src="restaurantUpload/<%=list.get(2)%>" width="375px"
						height="350px">
				</div>
				<div style="width: 380px; height: 350px; display: inline-block;">
					<img src="restaurantUpload/<%=list.get(3)%>" width="375px"
						height="350px">
				</div>
				<div style="width: 380px; height: 350px; display: inline-block;">
					<img src="restaurantUpload/<%=list.get(4)%>" width="375px"
						height="350px">
				</div>
			</div>
		</div>
		<div
			style="width: 1315px; min-height: 1000px; float: left; position: relative; left: 275px;">
			<form name="restaurant">
			<input type="hidden" id="cheres" name="cheres" value="<%=s%>"> <!-- false 면 이미 예약한 식당, true 면 예약가능한 식당 -->
			    
			    <input type="hidden" id="idrest" name="idrest" value="<%=idrest%>">
				<input type="hidden" id="rnum1" name="rnum1" value="<%=rnum1%>">
				<input type="hidden" id="dethome" name="dethome" value="<%=article.getDethome()%>"> 
				<input type="hidden" id="postnum" name="postnum" value="<%=article.getPostnum()%>">
				<input type="hidden" id="parking" name="parking" value="<%=article.getParking()%>">
				<input type="hidden" id="cell" name="cell" value="<%=article.getCell()%>">

				<div class="jumbotron"
					style="margin-bottom: 0px; background-color: white;">
					<h1>
						<%=article.getStore()%><font color="orange">&nbsp;&nbsp;<%=avg_pyung%></font>
					</h1>

					<p class="lead">
						(<%=article.getPostnum()%>)<br><%=article.getHome()%>
						&nbsp;&nbsp;<%=article.getDethome()%>
					</p>
					<p>
						
							
							<%if(s!=null){ %>							
							<input type="button" class="btn btn-success"
							onClick="rescancel()" style="color:black; " value="예약취소" />
							<input type="hidden" id="rresdate" name="rresdate" value="<%=s.getResdate()%>">
			    <input type="hidden" id="rrestime" name="rrestime" value="<%=s.getRestime()%>">
							<%}else{ %><input type="button" class="btn btn-success"
							onClick="reservation()" value="예약하기" />
							<%} %>
					</p>
				</div>
				<div style="width: 100%; height: 332px;">
					<div class="restauinfo"
						style="margin-left: 269px; text-align: center; padding: 0; float: left;">
						<h4>음식종류</h4>
						<p><%=article.getType()%></p>

						<h4>식당 주소</h4>
						<p>
							<%=article.getPostnum()%>
							<br><%=article.getHome()%>
							&nbsp;&nbsp;
							<%=article.getDethome()%>
						</p>

						<h4>전화번호</h4>
						<p><%=article.getCell()%></p>

						<h4>주차 여부</h4>
						<p><%=article.getParking()%></p>
					</div>
					<div class="restauinfo"
						style="text-align: center; padding: 0; float: left; bottom: 100px;">
						<h4>영업시간</h4>
						<p><%=article.getStart_time()%>
							-
							<%=article.getFinish_time()%></p>

						<h4>쉬는시간</h4>
						<p><%=article.getBreak_time()%></p>


						<h4>가격대</h4>
						<p><%=article.getPrice()%></p>

					</div>
				</div>
				<div>
					<div id="map" style="height: 364px; margin: 0 220px; width: 900px">
						<!-- * 카카오맵 - 지도퍼가기 -->
						<!-- 1. 지도 노드 -->
						<div style="width: 639px;"></div>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf5b09f6a8ad0eb6b151ed60b7c9af99&libraries=services"></script>
						<input type="hidden" name="home" id="home"
							value="<%=article.getHome()%>"> <input type="hidden"
							name="store" id="store" value="<%=article.getStore()%>">

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
					<%
						if (id!="id") {
					%>
					<div class="datdat" style="margin: 0 220px;">
						<div style="text-align: center;">
							<input type="hidden" id="id" name="id" value="<%=id%>" /> <input
								type="hidden" id="nick" name="nick" value="<%=nick%>" />
							<textarea style="height: 30px; width: 598px;" rows="2"
								placeholder="한줄 평을 남겨주세요." name="dcontent"
								onfocus="this.placeholder = ''" id="dcontent"
								onblur="this.placeholder = '한줄 평을 남겨주세요.'" style="border : none"></textarea>
						</div>
						<div style="border: solid 0px; text-align: center;">
							<select name="pyung" id="pyung">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
							<button type="button" class="btn btn-success"
								style="width: 500px;" id="datdu" name="datdu"
								onclick="datdung()">댓글 등록</button>
						</div>
						<div class="button"
							style="clear: right; margin: 50px 5px 0px 0px; border: solid 0px; width: 600px;">
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxP('1')">★</button>
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxP('2')">★★</button>
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxP('3')">★★★</button>
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxP('4')">★★★★</button>
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxP('5')">★★★★★</button>
							<button type="button"
								style="float: right; margin: 0px 5px 0px 0px;"
								class="btn btn-success" onclick="callAjaxALL()">전체정렬</button>
						</div>
					</div>
					<%
						} else {
						
					%>
					<input type="hidden" id="id" name="id" value="<%=id%>" />
					<div>
						<font style="color: red; font-size: 0.6cm; margin: 0 436px;">한줄
							평을 작성하려면 로그인이 필요합니다.</font>
					</div>
					<%
						}
					%>
				</div>
				<div id="datgul"
					style="height: 530px; position: relative; left: 220px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>작성자</th>
								<th>음식평</th>
								<th>내용</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>

							<%
									resdatDAO hdao = new resdatDAO();
									ArrayList<resdatDTO> hl = hdao.getList(rnum1);
									for (int i = 0; i < hl.size(); i++) { //
								%>
							<tr>

								<td><%=hl.get(i).getNick()%></td>
								<td>
									<%
											for (int h = 1; h <= hl.get(i).getPyung(); h++) {
										%>★<%
											}
										%>
								</td>

								<td style="width: 61%;"><%=hl.get(i).getDcontent()%></td>
								<td><%=hl.get(i).getDate().substring(0, 11) + hl.get(i).getDate().substring(11, 13) + "시"
						+ hl.get(i).getDate().substring(14, 16) + "분"%></td>
							</tr>
							<%
									}
								%>

						</tbody>
					</table>
				</div>
			</form>
		</div>

	</section>



	<%@include file="footer.jsp"%>
</body>
</html>
