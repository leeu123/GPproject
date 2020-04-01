<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function navcheck() {

		var islocationChk = false;
		var arr_location = document.getElementsByName("location");
		var istypeChk = false;
		var arr_type = document.getElementsByName("type");
		var ispriceChk = false;
		var arr_price = document.getElementsByName("price");

		for (var i = 0; i < arr_location.length; i++) {
			if (arr_location[i].checked == true) {
				islocationChk = true;
				break;
			}
		}

		for (var i = 0; i < arr_type.length; i++) {
			if (arr_type[i].checked == true) {
				istypeChk = true;
				break;
			}
		}

		for (var i = 0; i < arr_price.length; i++) {
			if (arr_price[i].checked == true) {
				ispriceChk = true;
				break;
			}
		}
		if (!islocationChk || !istypeChk || !ispriceChk) {
			alert("3가지 모두 체크해주세요.");
			return false;
		}

		document.nav.submit();
	}
</script>
<body>

	<FORM action="navsearch.do" method="post" name="nav"
		style="margin-top: 85px;">
		<table style="width: 80%; margin: 0 auto;">
			<thead>
				<tr>
					<th style="text-align: center; border: solid 1px #eaeaea;"><h1>지역
							선택</h1></th>
					<th style="text-align: center; border: solid 1px #eaeaea;"><h1>메뉴
							선택</h1></th>
					<th style="text-align: center; border: solid 1px #eaeaea;"><h1>가격
							선택</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="border: solid 1px #eaeaea;">


						<div class="boxes">
							<ul>
								<li><input type="checkbox" id="box-1" name="location"
									value="서울"> <label for="box-1">서울</label></li>
								<li><input type="checkbox" id="box-2" name="location"
									value="경기"> <label for="box-2">경기</label></li>
								<li><input type="checkbox" id="box-3" name="location"
									value="인천"> <label for="box-3">인천</label></li>
								<li><input type="checkbox" id="box-4" name="location"
									value="강원"> <label for="box-4">강원</label></li>
								<br>
								<li><input type="checkbox" id="box-5" name="location"
									value="대전"> <label for="box-5">대전</label></li>
								<li><input type="checkbox" id="box-6" name="location"
									value="세종"> <label for="box-6">세종</label></li>
								<li><input type="checkbox" id="box-7" name="location"
									value="충남"> <label for="box-7">충남</label></li>
								<li><input type="checkbox" id="box-8" name="location"
									value="충북"> <label for="box-8">충북</label></li>
								<br>
								<li><input type="checkbox" id="box-9" name="location"
									value="부산"> <label for="box-9">부산</label></li>
								<li><input type="checkbox" id="box-10" name="location"
									value="울산"> <label for="box-10">울산</label></li>
								<li><input type="checkbox" id="box-11" name="location"
									value="경남"> <label for="box-11">경남</label></li>
								<li><input type="checkbox" id="box-12" name="location"
									value="경북"> <label for="box-12">경북</label></li>
								<br>
								<li><input type="checkbox" id="box-13" name="location"
									value="대구"> <label for="box-13">대구</label></li>
								<li><input type="checkbox" id="box-14" name="location"
									value="광주"> <label for="box-14">광주</label></li>
								<li><input type="checkbox" id="box-15" name="location"
									value="전남"> <label for="box-15">전남</label></li>
								<li><input type="checkbox" id="box-16" name="location"
									value="전북"> <label for="box-16">전북</label></li>
								<br>
								<li><input type="checkbox" id="box-17" name="location"
									value="제주"> <label for="box-17">제주</label></li>
							</ul>
						</div>

					</td>




					<td style="border: solid 1px #eaeaea;">

						<div class="boxes">
							<ul id="menu-ul">
								<li><input type="checkbox" id="menu-1" name="type"
									value="한식"> <label for="menu-1">한식</label></li>
								<li><input type="checkbox" id="menu-2" name="type"
									value="중식"> <label for="menu-2">중식</label></li>
								<li><input type="checkbox" id="menu-3" name="type"
									value="일식"> <label for="menu-3">일식</label></li>

							</ul>
						</div>



						<div class="boxes">
							<ul id="menu-ul">
								<li><input type="checkbox" id="menu-4" name="type"
									value="양식"> <label for="menu-4">양식</label></li>
								<li><input type="checkbox" id="menu-5" name="type"
									value="세계음식"> <label for="menu-5">세계음식</label></li>
								<li><input type="checkbox" id="menu-6" name="type"
									value="뷔페"> <label for="menu-6">뷔페</label></li>

							</ul>
						</div>
					</td>


					<td style="border: solid 1px #eaeaea;">
						<div class="boxes">
							<ul id="menu-ul">
								<li><input type="checkbox" id="price-1" name="price"
									value="1만원이하"> <label for="price-1">만원이하</label></li>
								<li><input type="checkbox" id="price-2" name="price"
									value="1만원대"> <label for="price-2">1만원대</label></li>

							</ul>
						</div>
						<div class="boxes">
							<ul id="menu-ul">

								<li><input type="checkbox" id="price-3" name="price"
									value="2만원대"> <label for="price-3">2만원대</label></li>
								<li><input type="checkbox" id="price-4" name="price"
									value="3만원대"> <label for="price-4">3만원대</label></li>
							</ul>
						</div>





					</td>
				</tr>

				<tr>
					<td colspan="3" style="text-align: center;"><input
						type="button" class="btn btn-success" style="width: 70%;"
						value="검색" onClick="navcheck()"></td>
				</tr>

			</tbody>


		</table>
	</FORM>



</body>
</html>