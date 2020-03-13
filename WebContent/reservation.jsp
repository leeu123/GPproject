<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="controll.partyService"%>
<jsp:useBean id="restau" class="vo.DTO_AD" scope="page" />
<jsp:setProperty name="restau" property="rnum" />
<jsp:setProperty name="restau" property="store" />
<jsp:setProperty name="restau" property="postnum" />
<jsp:setProperty name="restau" property="home" />
<jsp:setProperty name="restau" property="dethome" />
<jsp:setProperty name="restau" property="parking" />
<jsp:setProperty name="restau" property="cell" />
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
	$(function() {
		//모든 datepicker에 대한 공통 옵션 설정
		$.datepicker
				.setDefaults({
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					,
					buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "+2M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				});

		//input을 datepicker로 선언
		$("#datepicker").datepicker();

		//To의 초기값을 내일로 설정
		$('#datepicker').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	
	function reservation(){
		var id = this.id.value;
		var rnum = this.rnum.value;
		var resdate = this.datepicker.value;
		var hour = this.hour.value;
		var minu = this.minu.value;
		
		var result = confirm("예약하시는 정보를 확인하셨습니까??");
		if(result){
			opener.document.location.href="reservation.do?rnum="+rnum+"&id="+id+"&resdate="+resdate+"&hour="+hour+"&minu="+minu;
			self.close();
		}else{
		    alert("다시 한번 확인해주십시오.");
		}
		
	}
	
	function cancel(){
		self.close();
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
	%>
	
	<input type="hidden" id="rnum" name="rnum" value="<%=restau.getRnum()%>"/>
             <input type="hidden" id="id" name="id" value="<%=id%>"/>
  
		<table class="table table-striped"
			style="margin: 10px auto; width: 90%; font-family: 굴림;">
			<tbody>
				<tr>
					<th
						style="height: 65px; font-size: 1cm; text-align: center; v-align: middle;"
						colspan="2">예 약&nbsp;&nbsp;정 보</th>
				</tr>
				<tr>
					<th>예약자 아이디</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>식당 이름</th>
					<td><%=restau.getStore()%></td>
				</tr>
				<tr>
					<th>식당 번호</th>
					<td><%=restau.getCell()%></td>
				</tr>
				<tr>
					<th>식당 주소</th>
					<td>(<%=restau.getPostnum()%>)&nbsp;<%=restau.getHome()%><br><%=restau.getDethome()%></td>
				</tr>
				<tr>
					<th>주차 가능 여부</th>
					<td><%=restau.getParking()%></td>
				</tr>
				<tr>
					<th>예약 날짜</th>
					<td><input type="text" id="datepicker" name="datepicker" style="line-height: 0;"></td>
				</tr>
				<tr style="height: 13px;">
					<td colspan="2"
						style="text-height: 0.5; font-size: 0.32cm; color: gray;">
						예약은 내일부터 두달 이내로만 가능합니다.</td>
				</tr>
				<tr>
					<th style="margin: 0 auto;">예약 시간</th>
					<td>
						<ul
							style="display: inline; list-style-type: none; padding: 0px; text-height: 0;">
							<li style="display: inline-block;"><select name="hour" id="hour"
								style="width: 80px;">
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
							<li style="display: inline-block;">시</li>
							<li style="display: inline-block;"><select name="minu" id="minu"
								style="width: 80px;">
									<option value="00">00</option>
									<option value="30">30</option>
							</select></li>
							<li style="display: inline-block;">분</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th colspan="2" style="text-height: 0.5; font-size: 0.35cm; text-align: center; color: red;">
									#예약정보를 정확히 확인하시고 예약하시기 바랍니다.
									</th>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="button" onClick="reservation()" class="btn btn-success" style="width: 150px;" value="예약하기">&nbsp;&nbsp;&nbsp;<input type="button" onClick="cancel()"class="btn btn-success" style="width: 150px;" value="취소">
					</td>
				</tr>
				<tr>
					<th colspan="2" style="text-height: 0.5; font-size: 0.35cm; text-align: center; color: red;">
					예약	하시면 빠른 시일내로 전화를 드리겠습니다.
					</th>
				</tr>

			</tbody>
		</table>

	<script language="javascript">
		
	</script>
</body>
</html>