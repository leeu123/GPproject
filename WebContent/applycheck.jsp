<%@ page language="java" contentType="text/html; charset=UTF-8"	%>
<%@ page import="java.sql.*"%>
<%@ page import="controll.partyService"%>
<jsp:useBean id="party" class="party.PartyDTO" scope="page" />
<jsp:setProperty name="party" property="*" />
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<%

String id = (String)session.getAttribute("id");
partyService sv = new partyService();
boolean tf = sv.seleApply(request, response);
if(tf){
	out.println("<script>");
	out.println("alert('이미 신청한 파티입니다.')");
	out.println("self.close()");
	out.println("</script>");
}

%>

<table class="table table-striped"
			style="margin: 10px auto; width: 90%; font-family: 굴림;">
			<tbody>
				<tr>
					<th
						style="height: 65px; font-size: 1cm; text-align: center; v-align: middle;"
						colspan="2">파 티&nbsp;&nbsp;정 보</th>
				</tr>
				<tr>
					<th style="width:150px;">신청자 아이디 :</th>
					<td><%=id%></td>
				</tr>
				<tr>
					<th>파티 식당 이름 :</th>
					<td><%=party.getRname() %></td>
				</tr>
				<tr>
					<th>파티 일자 :</th>
					<td><%=party.getPdate() %></td>
				</tr>
				<tr>
					<th>파티 시간 :</th>
					<td><%=party.getPtime() %></td>
				</tr>
				<tr>
					<th>식당 주소 :</th>
					<td><%=party.getAddr() %><br><%=party.getAddr1() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=party.getAddr2() %></td>
				</tr>
				<tr>
					<th>주최자 할말  :</th>
					<td><%=party.getPtalk()%></td>
				</tr>
				
				<tr>
					<th colspan="2" style="text-height: 0.5; font-size: 0.35cm; text-align: center; color: red;">
									#꼭 위의 내용을 확인하시고 파티 신청을 해주시기 바랍니다.
									</th>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;">
					<button type="button" onClick="party_apply()" class="btn btn-success">파티 신청</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onClick="apply_cancel()" class="btn btn-success">신청 취소</button>
					</td>
				</tr>

			</tbody>
		</table>
	    <input type="hidden" id="pnum1" name="pnum1" value="<%=party.getPnum() %>">
		<input type="hidden" id="id1" name="id1" value="<%=id %>"> 
<input type="hidden" id="addr" name="addr" value="<%=party.getAddr() %>">
		<input type="hidden" id="rname" name="rname" value="<%=party.getRname() %>">
	
		


<script language="javascript">
function party_apply(){
opener.document.location.href="partyapply.do?pnum="+this.pnum1.value+"&id=" + this.id1.value+"&addr="+ this.addr.value +"&rname="+this.rname.value;
self.close();
}
function apply_cancel(){
	opener.document.pappl
	self.close();
	}
</script>
</body>
</html>