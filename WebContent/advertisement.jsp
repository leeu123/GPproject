
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	if (session.getAttribute("id") == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요합니다..');");
		out.println("location.href='loginpage.jsp'");
		out.println("</script>");
	} else {
		String id = (String) session.getAttribute("id");

	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Party registration</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gpstylepartyregi1.css" />
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/partyregi.css" />

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
<script type="text/javascript" src="scripts/partyregi.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<script>
	function total_check() {

		var num = /^[0-9]+$/;
		var kor = /^[가-힣]+$/;
		var email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var name = advertisement.name.value
		var cell = advertisement.cell.value
		var em = advertisement.email.value
		var store = advertisement.store_name.value
		var dethome = advertisement.dethome.value
		var home = advertisement.home.value
		var food = advertisement.type.value
		var price = advertisement.price.value
		var parking = advertisement.parking.value
        var break_time = advertisement.break_time.value
		

		if (name == "") {

			alert("이름을 입력해주세요.")
			advertisemenet.name.focus()
		} else if (cell == "") {

			alert("전화번호를 입력해주세요.")
			advertisement.cell.focus()
		}else if (em == "") {

			alert("전화번호를 입력해주세요.")
			advertisement.em.focus()
		}
		else if (false === email.test(em)) {
			alert('이메일 형식에 맞게 작성해 주세요');
			advertisement.email.focus()
			advertisement.email.select()
		}else if (food == "음식 분류를 선택해주세요") {

			alert("음식카테고리를 선택해주세요")
			advertisement.type.focus()
		}else if (food == "메뉴 가격대 선택해 주세요") {

			alert("메뉴 가격대 선택해 주세요")
			advertisement.price.focus()
		}
		else if (break_time == "") {

			alert("브레이크타임을 입력해주세요.")
			advertisement.break_time.focus()
		}
		else if (parking == "주차가능여부를 선택해주세요") {

			alert("주차가능여부를 선택해주세요")
			advertisement.parking.focus()
		}
		else if (store == "") {
			alert("식당이름을 입력해주세요.")
			advertisement.store.focus()
		} else if (home == "") {

			alert("주소를 입력해주세요.")
			advertisement.home.focus()
		} else if (dethome == "") {

			alert("상세주소를 입력해주세요.")
			advertisement.dethome.focus()
		} else if (false === num.test(cell)) {
			alert('숫자만 입력하세요');
			advertisement.cell.focus()
			advertisement.cell.select()
		} else {
			document.advertisement.submit();
		}
	}
</script>

</head>
<body class="b">
	<%@include file="header.jsp"%>
	<div id="membership_totalbar">
		<center>
			<div id="ptitle">

				<img src="img/ptitle.jpg" width="1900px;" height="58px;">
			</div>

			<table>

				<FORM action="restaurantWritePro.bo" method="post"
					enctype="multipart/form-data" name="advertisement">
					<tbody>
						<tr style="height: 10px"></tr>
						<tr style="height: 20px;">
							<td colspan="2"><h3 style="font-weight: 600">광고접수</h3></td>
						</tr>
						<tr>
							<td class="l">담당자 이름</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" maxlength="15" class="f" name="name"
										placeholder="담당자 이름" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '담당자 이름'"> <input
										type="hidden" name="id" value="<%=id%>">
								</div>

							</td>
						</tr>
						<tr>
							<td class="l">전화번호</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" class="f" name="cell" placeholder="전화번호"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '전화번호'" maxlength = "11">
								</div>

							</td>
						</tr>



						<tr>
							<td>이메일</td>
						</tr>

						<tr>
							<td>
								<div>
									<input type="text" class="f" name="email" placeholder="이메일"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '이메일'">
								</div>
							</td>
						</tr>

						<tr>
							<td class="l">음식 카테고리</td>
						</tr>
						<tr>
							<td>
								<div>
									<select class="o" name="type">
										<option>음식 분류를 선택해주세요</option>
										<option>한식</option>
										<option>중식</option>
										<option>양식</option>
										<option>일식</option>
										<option>뷔페</option>
										<option>세계음식</option>
									</select>

								</div>
							</td>
						</tr>

						<tr>
							<td class="l">음식 금액대</td>
						</tr>
						<tr>
							<td>
								<div>
									<select class="o" name="price">
										<option>메뉴 가격대 선택해 주세요</option>
										<option>1만원이하</option>
										<option>1만원대</option>
										<option>2만원대</option>
										<option>3만원대</option>
									</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="l">영업시간</td>
						</tr>
						<tr>
							<td>
								<div> 
								    오픈
									<select class="o" name="start_time"style ="width : 100px;margin-left : 50px">
									
										<option>00시</option>
										<option>01시</option>
										<option>02시</option>
										<option>03시</option>
										<option>04시</option>
										<option>05시</option>
										<option>06시</option>
										<option>07시</option>
										<option>08시</option>
										<option>09시</option>
										<option>10시</option>
										<option>11시</option>
										<option>12시</option>
										<option>13시</option>
										<option>14시</option>
										<option>15시</option>
										<option>16시</option>
										<option>17시</option>
										<option>18시</option>
										<option>19시</option>
										<option>20시</option>
										<option>21시</option>
										<option>22시</option>
										<option>23시</option>
									</select>
								마감
									<select class="o" name="finish_time" style ="width : 100px;margin-left : 50px">
									
										<option>00시</option>
										<option>01시</option>
										<option>02시</option>
										<option>03시</option>
										<option>04시</option>
										<option>05시</option>
										<option>06시</option>
										<option>07시</option>
										<option>08시</option>
										<option>09시</option>
										<option>10시</option>
										<option>11시</option>
										<option>12시</option>
										<option>13시</option>
										<option>14시</option>
										<option>15시</option>
										<option>16시</option>
										<option>17시</option>
										<option>18시</option>
										<option>19시</option>
										<option>20시</option>
										<option>21시</option>
										<option>22시</option>
										<option>23시</option>
									</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>브레이크타임</td>
						</tr>

						<tr>
							<td>
								<div>
									<input type="text" class="f" name="break_time" placeholder="ex)14시~16시"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'ex)14시~16시'">
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="l">주차가능여부</td>
						</tr>
						<tr>
							<td>
								<div>
									<select class="o" name="parking">
										<option>주차가능여부를 선택해주세요</option>
										<option>주차가능</option>
										<option>주차불가능</option>
									
									</select>
								</div>
							</td>
						</tr>
						
						
						<tr>
							<td class="l">식당이름</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" class="f" name="store_name"
										placeholder="매장명" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '매장명'">
								</div>
							</td>
						</tr>


						<tr>
							<td class="l">우편번호</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" id="sample6_postcode" placeholder="우편번호"
										name="postnum" style="border: none"><input
										type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기" class="btn btn-success"
										style="margin-left: 69px;">
								</div>
							</td>
						</tr>



						<tr>
							<td class="l">주소</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" id="sample6_address" placeholder="주소"
										name="home" class="f">
								</div>
							</td>
						</tr>
						<tr>
							<td class="l">상세주소</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" id="sample6_detailAddress"
										placeholder="상세주소" name="dethome" class="f">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<input type="text" id="sample6_extraAddress" placeholder="참고항목">
									<script
										src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								</div>
							</td>
						</tr>


						<tr>

							<td class="l">비고</td>
						</tr>
						<tr>
							<td>
								<div>
									<textarea class="form-control" rows="5" name="content"
										required="required"></textarea>
								</div>

							</td>
						</tr>

						<tr>
							<td>식당 사진(음식사진5장이 반드시 필요합니다)</td>
						</tr>

						<tr>
							<td>
								<div>
									<input type="file" class="f" name="filename"
										required="required" >
										<input type="file" class="f" name="filename2"
										required="required" >
										<input type="file" class="f" name="filename3"
										required="required" >
										<input type="file" class="f" name="filename4"
										required="required" >
										<input type="file" class="f" name="filename5"
										required="required" >
								
								
								</div>
							</td>
						</tr>

						<tr>

							<td>
								<button onClick="total_check()" type="button"
									class="btn btn-success"
									style="width: 400px; height: 40px; margin-left: 9px;">등록하기</button>
							</td>
						</tr>
				</FORM>
			</table>

			<br />





		</center>
	</div>


	<%@include file="footer.jsp"%>

</body>
</html>



