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
<table style="margin:2% 10% 0 10% ; width:80%; font-family:굴림;">


<tbody>
<tr><td><h3>신청자 아이디 :</h3></td><td> <h3><%=id %></h3></td></tr>
<tr><td><h3>파티 식당 이름 :</h3></td><td> <h3><%=party.getRname() %></h3></td></tr>
<tr><td><h3>파티 일자 :</h3></td><td> <h3><%=party.getPdate() %></h3></td></tr>
<tr><td><h3>파티 시간 :</h3></td><td> <h3><%=party.getPtime() %></h3></td></tr>
<tr><td><h3>식당 지번 :</h3></td><td> <h3><%= party.getAddno() %></h3></td></tr>
<tr><td valign="top"><h3>식당 주소 :</h3></td><td> <h4><%=party.getAddr() %><br><%=party.getAddr1() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=party.getAddr2() %></h4></td></tr>
<tr><td><h3>주최자 할말  :</h3></td><td> <h4><%=party.getPtalk()%></h4></td></tr>
<tr style="height:20px;" ><td colspan="2"></td></tr>
<tr style="height:20px;" ><td colspan="2"><font color="red">꼭 위의 내용을 확인하시고 파티 신청을 해주시기 바랍니다.</font></td></tr>
<tr style="height:20px;" ><td colspan="2"></td></tr>
<tr><td colspan="2" align="center"><button type="button" onClick="party_apply()" class="btn btn-success">파티 신청</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onClick="apply_cancel()" class="btn btn-success">신청 취소</button></td></tr>

</tbody>
</table>
	    <input type="hidden" id="pnum1" name="pnum1" value="<%=party.getPnum() %>">
		<input type="hidden" id="id1" name="id1" value="<%=id %>"> 


<script language="javascript">
function party_apply(){
opener.document.location.href="partyapply.do?pnum="+this.pnum1.value+"&id=" + this.id1.value;
self.close();
}
function apply_cancel(){
	opener.document.pappl
	self.close();
	}
</script>
</body>
</html>