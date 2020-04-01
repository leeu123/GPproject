<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="party.*"%>
<%@ page import="controll.*"%>
<%
	ArrayList<PartyDTO> sic = (ArrayList<PartyDTO>) request.getAttribute("sic");
%>
<%	
	
	partyService ps = new partyService();  
	request.setAttribute("pnum", sic.get(0).getPnum()); // 파티번호에 가져오기
	int Apply_count  = ps.seleApplycount(request, response);
	boolean Applyable = ps.Applyable(request, response);
	
%>
<head>
<title>Party Information</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gpstyleparty.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/party_info.css" />
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
<script type="text/javascript" src="scripts/party.js"></script>
<script>
	function party_apply() {
		var id = papply.id.value;
		var ac = parseInt(papply.ac.value);
		var pno = parseInt(papply.pno.value);
		var aa = papply.aa.value;
		var pid = papply.pid.value;
		
		
		if (id == "id") {
			alert("로그인이 필요합니다.");
			location.href = "loginpage";
		}
		else if(id==pid){
			alert("주최자는 파티를 신청할 수 없습니다.");
		}
		else if(aa=="false"){
			
			alert("파티신청기간이 아닙니다.");
		}
		else if(ac==pno){
			
			alert("파티 정원이 모두 찼습니다.");			
		}
		else {
			window.open("applycheck?pnum="+papply.pnum.value+"&id=" + id + "&rname="+papply.rname.value + "&pdate="+papply.pdate.value + "&ptime="+papply.ptime.value + "&addno="+papply.addno.value + "&addr1="+papply.addr1.value + 
					"&addr2="+papply.addr2.value + "&addr="+papply.addr.value + "&ptalk="+papply.ptalk.value, "hjhj",
			"width=650,height=520");  // 새창을 띄워주는 코드 사이즈 지정과 함께
			
			
		}
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>

	<div style="width: 100%; height: 86px;"></div>
	<article></article>
	<form action="party_apply.jsp" name="papply">
	<input type="hidden" id="aa" name="aa" value="<%=Applyable%>">   <!--  파티 신청 가능기간인지 확인하기 위함 -->
	<input type="hidden" id="ac" name="ac" value="<%=Apply_count%>">   <!--  현재 파티 신청한 인원  -->
	<input type="hidden" id="pno" name="pno" value="<%=sic.get(0).getPno()%>">   <!--  파티 정원 확인 -->
	
	<input type="hidden" id="pnum" name="pnum" value="<%=sic.get(0).getPnum()%>">   
		<input type="hidden" id="id" name="id" value="<%=id%>"> 
		
		<input type="hidden" id="pid" name="pid" value="<%=sic.get(0).getId()%>">
		<input	type="hidden" id="rname" name="rname"value="<%=sic.get(0).getRname()%>"> 
		<input type="hidden" id="pdate" name="pdate" value="<%=sic.get(0).getPdate()%>"> 
		<input	type="hidden" id="ptime" name="ptime" value="<%=sic.get(0).getPtime()%>"> 
		<input type="hidden" id="addno" name="addno" value="<%=sic.get(0).getAddno()%>"> 
		<input type="hidden" id="addr1" name="addr1" value="<%=sic.get(0).getAddr1()%>"> 
		<input type="hidden" id="addr2" name="addr2" value="<%=sic.get(0).getAddr2()%>"> 
		<input type="hidden" id="addr" name="addr" value="<%=sic.get(0).getAddr()%>">
		<input type="hidden" id="ptalk" name="ptalk" value="<%=sic.get(0).getPtalk()%>">

		<section style="background: #f6f6f6;">
			<div
				style="width: 55%; height: 100%; background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
				<!--  파티  신청 상자 -->
				<table name="table1"
					style="width: 100%; height: 450px; border: 1px solid #a6a6a6; border-radius: 20px; margin-bottom: 1%">
					<tbody>
						<tr>
							<td style="padding: 20px; width: 70%; height: 95%"
								valign="middle">
								<div
									style="margin-bottom: 20px; width: 100%; height: 70px; border-bottom: solid 1px #eaeaea; font-family: 궁서; font-size: 1cm;"><%=sic.get(0).getRname()%></div>
								<table name="table2" style="width: 100%">
									<tbody>
										<tr>
											<!--  식당 사진 -->
											<td style="width: 55%;"><img
												src="party/<%=sic.get(0).getRfile()%>"
												style="width: 330px; height: 280px; margin-right: 10px;"></td>
											<!--  파티 신청 상제 정보 -->
											<td style="width: 45%; padding-top: 5px;" valign="top">
												<div
													style="width: 98%; height: 30px; border-bottom: solid 1px #A6A6A6; margin-bottom: 5px; text-align: left; font-size: 0.5cm">
													<b>파티 정보</b>
												</div>

												<table name="table3" style="font-size: 0.4cm">
													<tbody>
														<tr style="height: 30px; width: 37%">
															<td style="width: 38%;"><b>모임일자 : </b></td>
															<td></td>
															<td><%=sic.get(0).getPdate() + "     " + sic.get(0).getPtime()%>
															</td>
														</tr>

														<tr style="height: 10px;">
															<td colspan="3"></td>
														</tr>
														<tr style="height: 30px;">
															<td><b>접수기간 : </b></td>
															<td></td>

															<td><%=sic.get(0).getSins() + " ~ " + sic.get(0).getSinf()%></td>
														</tr>
														<tr style="height: 10px;">
															<td colspan="3"></td>
														</tr>
														<tr style="height: 30px;">
															<td><b>모임장소 :</b></td>
															<td></td>
															<td><%=sic.get(0).getAddr()%><br> <%=sic.get(0).getAddr1() + " " + sic.get(0).getAddr2()%>
															</td>
														</tr>
														<tr>
															<th
																style="height: 15px; border-bottom: dashed 0.5px #eaeaea;"
																colspan="3"></th>
														</tr>
														<tr>
															<th
																style="height: 5px; border-bottom: dashed 0.5px #eaeaea;"
																colspan="3"></th>
														</tr>
														<tr style="height: 30px;">
															<td><b>예상비용 : </b></td>
															<td></td>
															<td>1 인당 <%=sic.get(0).getPreprice()%></td>
														</tr>

													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td
								style="width: 30%; border-left: solid 1px #EAEAEA; padding: 5%;">
								<div
									style="margin: 3%; width: 94%; height: 30%; border-bottom: solid 0.5px #eaeaea;">
									<%
										int per = 0;
										per = (Apply_count)*100/Integer.parseInt(sic.get(0).getPno());							
									%>
									<table style="width: 100%;">
										<tbody>
											<tr>
												<td style="width: 70%;"><font
													style="font-size: 0.7cm; color: #23A41A; width: 100%; height: 20px; font-weight: 900; margin-bottom: 10px;"><%=Apply_count %>명
														신청</font></td>
												<td><div
														style="border: solid 1px #23A41A; border-radius: 5px; width: 50px; height: 25px; font-size: 0.5cm; text-align: center; color: #23A41A;"><%=per%>%
													</div></td>
											</tr>
											<tr style="height: 5px;"></tr>
											<tr>
												<td colspan="2" width="100%">
												<div style="float:left; background: green; height: 10px; width:<%=per%>%;"></div>
												<div style="float:left; background: #f6f6f6;height: 10px; width:<%=100-per%>%;"></div>
												</td>
											</tr>
											<tr style="height: 5px;"></tr>
											<tr>
												<td colspan="2" style="text-align: right;"><p
														style="font-size: 0.35cm;">
														모집인원
														<%=sic.get(0).getPno()%>명
													</p></td>
											</tr>
										</tbody>
									</table>


								</div>
								<div style="margin: 3%; width: 94%; height: 50%; padding: 5px;">
									<font
										style="font-size: 0.5cm; width: 100%; height: 20px; font-weight: 900;">주최자
										: <%=sic.get(0).getNick()%></font> <br>
									<p style="font-size: 0.35cm; margin-top: 15px; white-space:pre-line;">
										<%=sic.get(0).getPtalk()%>
									</p>
								</div>
								<div
									style="margin: 3%; width: 94%; height: 20%; border-top: dashed 0.5px #eaeaea; border-bottom: solid 0.5px #eaeaea; padding: 5px; color: red; font-size: 0.35cm;">
									※신청하시기 전에 <br>꼭 유의사항을 읽어주세요.
								</div>

							</td>
						</tr>
					</tbody>
				</table>

				<%@include file="partynotice.jsp"%>
				<div
					Style="width: 100%; height: 50px; text-align: center; margin-top: 2%;">
					<button type="button" onClick="party_apply()" class="btn btn-success"
						style="width: 70%;" >파티 신청</button><br> <font
						style="color: red;">신청하시기 전에 꼭 유의사항을 읽어주세요.</font>
				</div>
			</div>
		</section>
	</form>

	<%@include file="footer.jsp"%>

</body>

</html>