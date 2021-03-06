<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="controll.partyService" %>
<%@ page import = "java.util.*" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "party.PartyDTO" %>
<%@ page import = "vo.*" %>
<%@ page import = "resdat.resdatDTO" %>

<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function deleteparty(s){ //파티 없애기
	
	var re = confirm("파티를 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleteparty.do?pnum="+s;		
	}
	
}
//=================페이징 처리 식당
function pageParty1(s) {	
	$.ajax({
		type : "post",
		url : "./manage_party1.jsp",
		data : {
			page:s,
		},
		success : whenSuccessP,
		error : whenErrorP
	});
}
function whenSuccessP(resdata) {
	$("#party1").html(resdata);
}
function whenErrorP() {
	alert("Error");
}
</script>
<title></title>
</head>
<body>
    	
	<div>
	
	<table class="table table-striped" style=" margin-top:10px;" id="party1">
	<thead>
	<tr><th colspan="5" style="text-align:center;">[완료된 파티]</th></tr>
	<tr><th style="width:55%;">제목</th><th>주최자</th><th>예상가격</th><th>파티날짜</th><th></th></tr>
	</thead>
	<tbody>
     <% 
	
	partyService ps = new partyService();
     List<PartyDTO> ptt = ps.party1all(request, response);  // 아이디에 맞는 신청한 파티 들고오기
    int pa = Integer.parseInt(request.getParameter("page"));
    int pag = ptt.size()/20;
    int num = 11;
    int pg = 20;
    int st = (pa-1)/10;
    
    if(st == (pag/10)){
    	num = (pag%10)+2;
    }
    
    if(pa == (pag+1)){
    	pg = ptt.size()%20;
    }
    
    
	%>
	
	<% 
		for(int i = ((pa-1)*20); i <((pa-1)*20)+pg;i++){ %>
	
	<tr><td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getTitle() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getNick()%></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPreprice() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPdate() %></a></td>
	<td><a href="javascript:deleteparty('<%=ptt.get(i).getPnum() %>')"><input type="button" value="삭제"></a></td></tr>
		<%}%>
		<tr><td colspan="5" style="text-align:center;">
		<%if(st!=0){%>	
		<button class="btn btn-success" onClick="pageParty1('<%=((st-1)*10)+1%>')">◀</button>
		<%}for(int k =(st*10)+1; k<(st*10)+num; k++){%>
	     <button class="btn btn-success" onClick="pageParty1('<%=k%>')"><%=k %></button>
	<% } if(st != (pag/10)){ %>
	<button class="btn btn-success" onClick="pageParty1('<%=((st+1)*10)+1 %>')">▶</button>
	<%} %>
	</td></tr>
	</tbody>
	</table>
		
	
	</div>
	
	

</body>
</html>
