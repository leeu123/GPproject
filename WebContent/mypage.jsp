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

<title>그린플레이트 게시판</title>

<script type="text/javascript" src="_scripts/login.js"></script>

</head>
<body>
    

	<%@include file="header.jsp"%>
	
	
	<%
	
	partyService ps = new partyService();
	request.setAttribute("id", id);
	MemberDTO mb = ps.member(request, response);
	
	
	
	
	
	
	%>
	
	<nav style="background-color:#47C83E; margin-top: 150px; height:60px; margin-bottom: 70px;text-align:center; font-size: 1cm; color:white;">
	* &nbsp;My &nbsp;&nbsp;Page&nbsp; *
	
	</nav>
	<section style="min-height: 649px;width: 100%; display:flex;">
	<div style="width:10%;">	
	
	
	</div>
	<div style="width:20%; margin-right:3%; background-color:#eaeaea; ">
	<table class="table table-striped" style=" margin-top:10px;">
	
	<tbody>
	<tr><td colspan="2" style="text-align:center;">     <img src = "img/Gplogov.png" width="100px" height="100px"></td></tr>
	<tr><th>아이디</th><td><%=mb.getId()%> </td></tr>
	<tr><th>이름</th><td> <%=mb.getName() %></td></tr>
	<tr><th>닉네임</th><td><%=mb.getNick() %> </td></tr>
	<tr><th>이메일</th><td> <%=mb.getEmail() %></td></tr>	
	
	<tr></tr>	
	</tbody>
	
	
	
	</table>

	</div>
	
	
	<!--  파티 신청 글이나 게시판 작성한 글 -->
	<div style="width:60%;">
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;">[최근 작성한 댓글]</th></tr>
	<tr><th>식당이름</th><th>음식평</th><th style="width:55%;">내용</th><th>날짜</th></tr>
	</thead>
	<tbody>
     <% List<resdatDTO> rd = ps.resdat(request, response);  // 아이디에 맞는 신청한 파티 들고오기
     
     
     if(rd!=null){
    	 for(int i = 0; i <rd.size();i++){%>
	<tr>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getStore() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%for(int k = 0; k <rd.get(i).getPyung();k++){ %>★<%} %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDcontent() %></a></td>
	<td><a href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDate()%></a></td>
		<%}}else{
			%><tr><td colspan="4" style="color:red;">작성한 댓글이 없습니다.</td></tr>
		<%} %>
	</tbody>
	</table>
	
	
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;">[내가 신청한 파티]</th></tr>
	<tr><th style="width:55%;">제목</th><th>주최자</th><th>예상가격</th><th>파티날짜</th></tr>
	</thead>
	<tbody>
     <% List<PartyDTO> appt = ps.apparty(request, response);  // 아이디에 맞는 신청한 파티 들고오기
     
     
     if(appt!=null){
    	 for(int i = 0; i <appt.size();i++){%>
	<tr><td><a href="partyinfore.do?pnum=<%=appt.get(i).getPnum()%>"><%=appt.get(i).getTitle() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=appt.get(i).getPnum()%>"><%=appt.get(i).getNick()%></a></td>
	<td><a href="partyinfore.do?pnum=<%=appt.get(i).getPnum()%>"><%=appt.get(i).getPreprice() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=appt.get(i).getPnum()%>"><%=appt.get(i).getPdate() %></a></td></tr>	
		<%}}else{
			%><tr><td colspan="4" style="color:red;">신청한 파티가 없습니다.</td></tr>
		<%} %>
	</tbody>
	</table>
	
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;"> [작성한 Q_A ]</th></tr>
	<tr><th style="width:70%;">제목</th><th>날짜</th></tr>
	</thead>
	<tbody>
	<% List<BoardBean> bb = ps.QnA(request, response);
	
	
	if(bb!=null){
		for(int i = 0; i <bb.size();i++){ %>
		
	<tr><td><a href="boardDetail.bo?board_num=<%=bb.get(i).getQnum()%>&page=1&id=<%=id%>"><%=bb.get(i).getQtitle()%></a></td>
	<td><a href="boardDetail.bo?board_num=<%=bb.get(i).getQnum()%>&page=1&id=<%=id%>"><%=bb.get(i).getDate() %></a></td>
	
		<%}}else{%>
		<tr><td colspan="4" style="color:red;">아직 작성한 Q_A가 없습니다.</td></tr>
		<%} %>		
	</tbody>
	</table>
	
	
	
     <table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;"> [작성한 리뷰]</th></tr>
	<tr><th style="width:65%;">제목</th><th>지역</th><th>날짜</th></tr>
	</thead>
	<tbody>

	<% List<ReviewBean> rb = ps.review(request, response);
	
	
	if(rb!=null){
		for(int i = 0; i <rb.size();i++){ %>
	<tr><td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getRtitle()%></a></td>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getLocation() %></a></td>
	<td><a href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getDate() %></a></td></tr>	
		<%}}else{%>
		<tr><td colspan="4" style="color:red;">아직 작성한 리뷰가 없습니다.</td></tr>
		<%} %>	
	</tbody>
	</table>
	
	
	
	
	
	
	
	
	
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;">[내가 모집하는 파티]</th></tr>
	<tr><th style="width:55%;">제목</th><th>주최자</th><th>예상가격</th><th>파티날짜</th></tr>
	</thead>
	<tbody>
     <% List<PartyDTO> pt = ps.party(request, response);  // 아이디에 맞는 신청한 파티 들고오기
     
     
     if(pt!=null){
    	 for(int i = 0; i <pt.size();i++){%>
	<tr><td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getTitle() %></a></td>
	<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getNick()%></a></td>
	<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getPreprice() %></a></td>
	<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getPdate() %></a></td></tr>	
		<%}}else{
			%><tr><td colspan="4" style="color:red;">현재 모집하는 파티가 없습니다.</td></tr>
		<%} %>
	</tbody>
	</table>
	
	
	<table class="table table-striped" style=" margin-top:10px;">
	<thead>
	<tr><th colspan="4" style="text-align:center;">[내가 모집했던 파티]</th></tr>
	<tr><th style="width:55%;">제목</th><th>주최자</th><th>예상가격</th><th>파티날짜</th></tr>
	</thead>
	<tbody>
     <% List<PartyDTO> ptt = ps.party1(request, response);  // 아이디에 맞는 신청한 파티 들고오기
     
     
     if(ptt!=null){
    	 for(int i = 0; i <ptt.size();i++){%>
	<tr><td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getTitle() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getNick()%></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPreprice() %></a></td>
	<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPdate() %></a></td></tr>	
		<%}}else{
			%><tr><td colspan="4" style="color:red;">모집했던 파티가 없습니다.</td></tr>
		<%} %>
	</tbody>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
	
	
</section>
<div><%@include file="footer.jsp"%></div>
	

</body>
</html>
