<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="party.*"%>
<%@ page import="controll.*"%>
<%
	ArrayList<PartyDTO> sic = (ArrayList<PartyDTO>)request.getAttribute("sic");
%>
<%
	
String pnum = request.getParameter("pnum");

partyService ps = new partyService();
request.setAttribute("pnum", sic.get(0).getPnum());
int Apply_count  = ps.seleApplycount(request, response);
%>

<head>
<title>Party Information</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gpstyleparty.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/party_infore.css" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
  
    //=================입력 Ajax
	function datdung() {
    	if(this.id.value=="null"){
    		alert("로그인이 필요합니다.");
    	}
    	else if(this.rcontent.value == "") {
			alert("댓글을 입력하여주십시오.");
		} else {
			callAjax();
		}
	}
	function callAjax() {
		$.ajax({
			type : "post",
			url : "./preview.jsp",
			data : {
				pnum : $('#pnum').val(),
				rcontent : $('#rcontent').val(),
				id : $('#id').val(),
				nick : $('#nick').val(),
			},
			success : whenSuccess,
			error : whenError
		});
	}
	function whenSuccess(resdata) {
		alert("댓글이 입력되었습니다.");
		$("#datgel").html(resdata);
		$('#rcontent').val("");
	}
	function whenError() {
		alert("Error");
	}
	
</script>

</head>
<body>
	<%@include file="header.jsp"%>
	<div style="width: 100%; height: 86px;"></div>
	<article></article>
	<section style="background: #f6f6f6;">
	<input type="hidden" id="pnum" name="pnum" value="<%=pnum%>">
		<div
			style="width: 55%; height: 100%; background: white; padding-top: 1%; padding-left: 2%; padding-right: 2%; margin: 0 auto;">
			<!--  파티  신청 상자 -->
			<table name="table1"
				style="width: 100%; height: 450px; border: 1px solid #a6a6a6; border-radius: 20px; margin-bottom: 1%">
				<tbody>
					<tr>
						<td style="padding: 20px; width: 70%; height: 95%" valign="middle">
							
							<div style="margin-bottom: 20px; width: 100%; height: 70px; border-bottom: solid 1px #eaeaea; font-family: 궁서; font-size: 1cm;"><%=sic.get(0).getRname()%></div>
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
														<td><%=sic.get(0).getPdate()+"     "+sic.get(0).getPtime()%>
														</td>
													</tr>

													<tr style="height: 10px;">
														<td colspan="3"></td>
													</tr>
													<tr style="height: 30px;">
														<td><b>접수기간 : </b></td>
														<td></td>

														<td><%=sic.get(0).getSins()+" ~ "+sic.get(0).getSinf()%></td>
													</tr>
													<tr style="height: 10px;">
														<td colspan="3"></td>
													</tr>
													<tr style="height: 30px;">
														<td><b>모임장소 :</b></td>
														<td></td>
														<td><%=sic.get(0).getAddr()%><br> <%=sic.get(0).getAddr1()+" "+sic.get(0).getAddr2()%>
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
										: <%=sic.get(0).getNick()%></font>
								<br>
								<p style="font-size: 0.35cm; margin-top: 15px;">
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
			<div class="datre">
				<div style="text-align: center;">
				<%if((String)session.getAttribute("id")!=null){ %>
				<label> 닉네임 :</label>
				<input type="hidden" id="id" name="id" value="<%=id%>">
				
					<input type="text" id="nick" name="nick" value="<%=nick%>" style="width: 150px; height: 30px; margin-bottom: 5px; border: none;" readonly />
						
					<textarea style="height: 100px; width: 900px; margin-bottom: 5px;"
						rows="10" placeholder="파티 후기를 남겨주세요." name="rcontent"
						onfocus="this.placeholder = ''" id="rcontent"
						onblur="this.placeholder = '파티 후기를 남겨주세요.'" style="border : none"></textarea>
				</div>
				<div style="border: solid 0px; text-align: center;">
					<button type="button" class="btn btn-success" style="width: 500px;"
						id="datdu" name="datdu" onclick="datdung()">후기 등록</button>
				</div>
				<%}else{%>    <font style="color:red; font-size:0.6cm;">댓글을 작성하려면 로그인이 필요합니다.</font><% } %>
			</div>
			<div id="datgel"><%@include file="preview2.jsp" %></div>
			
		</div>
	</section>

	<%@include file="footer.jsp"%>

</body>

</html>
