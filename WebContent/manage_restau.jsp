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
//=================페이징 처리 식당
function pageRestau(s) {	
	$.ajax({
		type : "post",
		url : "./manage_restau.jsp",
		data : {
			page:s,
		},
		success : whenSuccessP,
		error : whenErrorP
	});
}
function whenSuccessP(resdata) {
	$("#rest").html(resdata);
}
function whenErrorP() {
	alert("Error");
}
</script>
<title></title>
</head>
<body>
    	
	<div>
	
	<table class="table table-striped" style=" margin-top:10px;" id="rest">
	<thead>
	<tr><th colspan="7" style="text-align:center;"> [등록된 식당]</th></tr>
	<tr><th>식당번호</th><th>등록인</th><th>식당종류</th><th>지역</th><th>식당이름</th><th style="width:55%;">주소</th><th></th></tr>
	</thead>
	<tbody>
	
	<%
	
	partyService ps = new partyService();
    List<DTO_AD> rs = ps.restauall(request, response);
    int pa = Integer.parseInt(request.getParameter("page"));
    int pag = rs.size()/20;
    int num = 11;
    int pg = 20;
    int st = (pa-1)/10;
    
    if(st == (pag/10)){
    	num = (pag%10)+2;
    }
    
    if(pa == (pag+1)){
    	pg = rs.size()%20;
    }
    
    
	%>
	
	<% 
		for(int i = ((pa-1)*20); i <((pa-1)*20)+pg;i++){ %>
	
	<tr>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getRnum() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getId() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getType() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getLocation() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getStore()%></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>">(<%=rs.get(i).getPostnum() %>)<%=rs.get(i).getHome() %>&nbsp;&nbsp;<%=rs.get(i).getDethome() %></a></td>
	<td><input type="button" value="삭제"></td></tr>
		<%}%>
		<tr><td colspan="7" style="text-align:center;">
		<%if(st!=0){%>	
		<button class="btn btn-success" onClick="pageRestau('<%=((st-1)*10)+1%>')">◀</button>
		<%}for(int k =(st*10)+1; k<(st*10)+num; k++){%>
	     <button class="btn btn-success" onClick="pageRestau('<%=k%>')"><%=k %></button>
	<% } if(st != (pag/10)){ %>
	<button class="btn btn-success" onClick="pageRestau('<%=((st+1)*10)+1 %>')">▶</button>
	<%} %>
	</td></tr>
	</tbody>
	</table>
		
	
	</div>
	
	

</body>
</html>
