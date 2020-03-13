<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
     String id1= null;
     String nick1 =null;
     
    if(session.getAttribute("id")==null){
    	out.println("<script>");
		out.println("alert('로그인이 필요합니다..');");
		out.println("location.href='loginpage.jsp'");
		out.println("</script>");
    }else{
    
    id1 = (String)session.getAttribute("id");
    nick1 = (String)session.getAttribute("nick");
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
	function parregi() {
		
		var title = party.title.value;
		var email = party.email.value;
		var phone = party.phone.value;
		var rname = party.rname.value;
		var addno = party.addno.value;
		var addr = party.addr.value;
		var addr1 = party.addr1.value;
		var addr2 = party.addr2.value;
		var pdate = party.pdate.value;
		var pno = party.pno.value;
		var preprice = party.preprice.value;
		var ptalk = party.ptalk.value;

		
		
		if (title==""||email == "" || phone == "" || rname == ""|| addno == ""
				|| addr == "" || addr1 == "" || pdate == ""
				|| pno == "" || preprice == "" || ptalk == "") {
			alert("입력되지 않은 사항이 있습니다.");
		} else {
			document.party.submit();
		}
	}

	function findaddress() {
		new daum.Postcode({
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
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraaddress").value = extraAddr;

				} else {
					document.getElementById("extraaddress").value = "";
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addpost").value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailaddress").focus();
			}
		}).open();
	}
</script>

</head>
<body>
	<%@include file = "header.jsp"%>

	<section>
		<form name="party" action="partyregi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="<%=id%>">
		<input type="hidden" id="nick" name="nick" value="<%=nick%>">
			<div style="width: 1900px; height: 86px;"></div>
			<article></article>
			<div id="ptitle">

				<img src="img/ptitle.jpg" width="1900px;" height="58px;">
			</div>
			<table>
				<tbody>
					<tr style="height: 10px"></tr>
					<tr style="height: 20px;">
						<td colspan="2"><h3 style="font-weight: 600">파티모집 제목</h3></td>
					</tr>

					<tr>
						<td class="l">제목</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" name="title" class="f"
									placeholder="파티모집 제목을 입력하세요" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '파티모집 제목을 입력하세요'">
							</div>

						</td>
					</tr>
					
					<tr style="height: 20px;">
						<td colspan="2"><h3 style="font-weight: 600">주최자 정보</h3></td>
					</tr>

					<tr>
						<td class="l">이메일</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="email" name="email" class="f"
									placeholder="이메일을 입력하세요" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '이메일을 입력하세요'">
							</div>

						</td>
					</tr>

					<tr>
						<td>휴대전화</td>
					</tr>

					<tr>
						<td>
							<div>
								<input type="text" name="phone" class="f" maxlength="11"
									placeholder="-없이 입력해주세요" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '-없이 입력해주세요'">
							</div>
						</td>
					</tr>

					<tr style="height: 20px;">
						<td colspan="2"><h3 style="font-weight: 600">파티 정보</h3></td>
					</tr>
					
					<tr>
						<td class="l">카테고리</td>
					</tr>
					<tr>
						<td>
							<div><select name="cate" class="f">
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
									<option value="세계음식">세계음식</option>
									<option value="뷔페">뷔페</option>
								</select>
								<!-- <input type="text" id="cata" placeholder="카테고리를을 입력하여 주십시오."
									name="cata" class="f" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '식당이름을 입력하여 주십시오.'"> -->
							</div>
						</td>
					</tr>

					<tr>
						<td class="l">식당 이름</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" id="rname" placeholder="식당이름을 입력하여 주십시오."
									name="rname" class="f" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '식당이름을 입력하여 주십시오.'">
							</div>
						</td>
					</tr>


					<tr>
						<td class="l">우편번호</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" id="addpost" placeholder="우편번호"
									name="addno" style="border: none"> <input
									type="button" onclick="findaddress()" value="우편번호 찾기"
									class="btn btn-success" style="margin-left: 50px;">
							</div>
						</td>
					</tr>



					<tr>
						<td class="l">주소</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" id="address" placeholder="주소" name="addr"
									class="f">
							</div>
						</td>
					</tr>
					<tr>
						<td class="l">상세주소</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" id="detailaddress" placeholder="상세주소"
									name="addr1" class="f">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" id="extraaddress" name="addr2"
									placeholder="참고항목">
							</div>
						</td>
					</tr>
					
					<tr>
						<td class="l">첨부사진</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="file" id="rfile" placeholder="첨부파일"
									name="rfile" style="border: none"> 
							</div>
						</td>
					</tr>


					<tr>

						<td class="l">파티일자</td>
					</tr>
					<tr>
						<td>
							<div>
								<input type="text" name="pdate" class="f"
									placeholder="파티일자를 입력해주세요. ex)200106"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '파티일자를 입력해주세요. ex)200106'">
							</div>

						</td>
					</tr>
					
					<tr>
						<td class="l">파티 시간</td>
					</tr>
					<tr>
						<td>
							<div><ul style="display:inline; list-style-type:none; padding:0px;">
								<li><select name="hour" class="f" style="width:100px;">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
								</select></li>
								<li><h4>시</h4></li>
								<li><select name="minu" class="f" style="width:100px;">
									<option value="00">00</option>
									<option value="30">30</option>
								</select></li>
								<li><h4>분</h4></li>
								</ul>
							</div>
						</td>
					</tr>

					<tr>
						<td class="l">모집인원</td>
					</tr>
					<tr>
						<td>
							<div>
								<select name="pno" class="f">
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="6">6명</option>
									<option value="7">7명</option>
									<option value="8">8명</option>
								</select>
							</div>
						</td>
					</tr>

					<tr>
						<td>파티 1인당 예상 금액</td>
					</tr>

					<tr>
						<td>
							<div>
								<input type="text" name="preprice" class="f"
									placeholder="인당 예상 금액을 입력하여주세요." onfocus="this.placeholder = ''"
									onblur="this.placeholder = '인당 예상 금액을 입력하여주세요.'">
							</div>
						</td>
					</tr>




					<tr>
						<td>남길 말</td>
					</tr>

					<tr>
						<td>
							<div>
								<textarea class="f" style="height: 80px; width: 370px;" rows="3"
									placeholder="남기실 말을 적어주세요." name="ptalk"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '남기실 말을 적어주세요.'"
									style="border : none"></textarea>
							</div>
						</td>
					</tr>



					<tr>
						<td>
							<button onClick="parregi()" type="button" class="btn btn-success"
								style="width: 400px; height: 40px; margin-left: 9px;">모집하기</button>
						</td>
					</tr>


				</tbody>
			</table>
		</FORM>
	</section>

<%@include file = "footer.jsp"%>

</body>
</html>



