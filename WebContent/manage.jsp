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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>관리자 페이지</title>

<script type="text/javascript" src="_scripts/login.js"></script>
<script>
function deleteresdat(s){ // 식당 댓글 없애기
	
	var re = confirm("댓글을 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleteresdat.do?dnum="+s;		
	}
	
}



//=================메뉴별로 나오기
function menuAjax(s) {
	$.ajax({
		type : "post",
		url : "./manage2.jsp",
		data : {
			title:s,
		},
		success : whenSuccessP,
		error : whenErrorP
	});
}


function pageResdat(s) {	
	$.ajax({
		type : "post",
		url : "./manage_resdat.jsp",
		data : {
			page:s,
		},
		success : whenSuccessP,
		error : whenErrorP
	});
}
function whenSuccessP(resdata) {
	$("#management").html(resdata);
}
function whenErrorP() {
	alert("Error");
}
</script>

</head>
<body>
    

	<%@include file="header.jsp"%>
	
	
	<%
	
	partyService ps = new partyService();
	request.setAttribute("id", id);
	MemberDTO mb = ps.member(request, response);
	
	%>
	
	<nav style="background-color:#eaeaea; margin-top: 150px; height:60px; margin-bottom: 70px;text-align:center; font-size: 1cm; color:purple;">
	*MANAGE*
	
	</nav>
	<section style="min-height: 649px;width: 100%; display:flex;">
	<div style="width:10%;">	
	
	
	</div>
	<div style="width:20%; margin-right:3%; background-color:#eaeaea; ">
	<table class="table table-striped" style=" margin-top:10px;">
	
	<tbody>
	<tr><td colspan="2" style="text-align:center;">     <img src = "img/Gplogov.png" width="100px" height="100px"></td></tr>
	
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('comment')">댓글</button></th></tr>
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('QnA')">Q_A</button></th></tr>	
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('review')">리뷰</button></th></tr>	
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('party')">진행중인 파티</button></th></tr>
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('party1')">완료된 파티</button></th></tr>
	<tr><th ><button style="border:none; background:none;" onClick="menuAjax('restau')">등록된 식당</button></th></tr>
	
	
	</tbody>
	
	
	
	</table>

	</div>
	
	
	<!--  파티 신청 글이나 게시판 작성한 글 -->
	<div style="width:60%;" id="management" name="management">
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="6" style="text-align:center;">[댓글]</th></tr>
	<tr><th>식당이름</th><th>작성자</th><th>음식평</th><th style="width:50%;">내용</th><th>날짜</th><th></th></tr>
	</thead>
	<tbody>
     <% List<resdatDTO> rd = ps.resdatall(request, response); // 아이디에 맞는 신청한 파티 들고오기
     
     if(rd != null){
    	 int pa=1;
         if(request.getParameter("page")!=null){
         pa = Integer.parseInt(request.getParameter("page"));}
         int pag = rd.size()/20;
         int num = 11;
         int pg = 20;
         int st = (pa-1)/10;
         
         if(st == (pag/10)){
         	num = (pag%10)+2;
         }
         
         if(pa == (pag+1)){
         	pg = rd.size()%20;
         }
    	 for(int i = 0; i <rd.size();i++){%>
	<tr>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getStore() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getNick() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%for(int k = 0; k <rd.get(i).getPyung();k++){ %>★<%} %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDcontent() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDate()%></a></td>
	<td><a href="javascript:deleteresdat('<%=rd.get(i).getDnum() %>')"><input type="button" value="삭제"></a></td></tr>
		<%}%>
		<tr><td colspan="6" style="text-align:center;">
		<%if(st!=0){%>	
		<button class="btn btn-success" onClick="pageResdat('<%=((st-1)*10)+1%>')">◀</button>
		<%}for(int k =(st*10)+1; k<(st*10)+num; k++){%>
	     <button class="btn btn-success" onClick="pageResdat('<%=k%>')"><%=k %></button>
	<% } if(st != (pag/10)){ %>
	<button class="btn btn-success" onClick="pageResdat('<%=((st+1)*10)+1 %>')">▶</button>
	<%}}else{%><tr><td colspan="6" style="color:red;">작성된 댓글이 없습니다.</td></tr>
		<%} %>
	</tbody>
	</table>
	
	</div>
	
	
	
	
</section>
<div><%@include file="footer.jsp"%></div>
	

</body>
</html>
