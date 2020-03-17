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
function pageReview(s) {	
	$.ajax({
		type : "post",
		url : "./manage_review.jsp",
		data : {
			page:s,
		},
		success : whenSuccessP,
		error : whenErrorP
	});
}
function whenSuccessP(resdata) {
	$("#review").html(resdata);
}
function whenErrorP() {
	alert("Error");
}
</script>
<title></title>
</head>
<body>
    	
	<div>
	
	<table class="table table-striped" style=" margin-top:10px;" id="review">
	<thead>
	<tr><th colspan="5" style="text-align:center;"> [ 리뷰 ]</th></tr>
	<tr><th>작성자</th><th style="width:65%;">제목</th><th>지역</th><th>날짜</th><th></th></tr>
	</thead>
	<tbody>
	
	<%
	
	partyService ps = new partyService();
	List<ReviewBean> rb = ps.reviewall(request, response);
    int pa = Integer.parseInt(request.getParameter("page"));
    int pag = rb.size()/20;
    int num = 11;
    int pg = 20;
    int st = (pa-1)/10;
    
    if(st == (pag/10)){
    	num = (pag%10)+2;
    }
    
    if(pa == (pag+1)){
    	pg = rb.size()%20;
    }
    
    
	%>
	
	<% 
		for(int i = ((pa-1)*20); i <((pa-1)*20)+pg;i++){ %>
	
	<tr>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getNick()%></a></td>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getRtitle()%></a></td>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getLocation() %></a></td>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getDate() %></a></td>
	<td><input type="button" value="삭제"></td>
	</tr>	
		<%}%>
		<tr><td colspan="5" style="text-align:center;">
		<%if(st!=0){%>	
		<button class="btn btn-success" onClick="pageReview('<%=((st-1)*10)+1%>')">◀</button>
		<%}for(int k =(st*10)+1; k<(st*10)+num; k++){%>
	     <button class="btn btn-success" onClick="pageReview('<%=k%>')"><%=k %></button>
	<% } if(st != (pag/10)){ %>
	<button class="btn btn-success" onClick="pageReview('<%=((st+1)*10)+1 %>')">▶</button>
	<%} %>
	</td></tr>
	</tbody>
	</table>
		
	
	</div>
	
	

</body>
</html>
