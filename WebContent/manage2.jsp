<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="controll.partyService"%>
<%@ page import="java.util.*"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="party.PartyDTO"%>
<%@ page import="vo.*"%>
<%@ page import="resdat.resdatDTO"%>

<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function deleteresdat(s){ // 식당 댓글 없애기
	
	var re = confirm("댓글을 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleteresdat.do?dnum="+s;		
	}
	
}

function deleteqna(s){ // QnA 없애기
	
	var re = confirm("QnA를 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleteqna.do?qnum="+s;		
	}
	
}

function deletereview(s){ // 리뷰 없애기
	
	var re = confirm("리뷰를 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deletereview.do?rnum="+s;		
	}
	
}

function deleteparty(s){ //파티 없애기
	
	var re = confirm("파티를 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleteparty.do?pnum="+s;		
	}
	
}

function deleterestau(s){ // 식당 없애기
	
	var re = confirm("식당을 삭제하시겠습니까??");
	
	
	if(re){
		location.href="deleterestau.do?rnum="+s;		
	}
	
}
	//=================페이징 처리 식당
	function pageRestau(s) {
		$.ajax({
			type : "post",
			url : "./manage_restau.jsp",
			data : {
				page : s,
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
				page : s,
			},
			success : whenSuccessP,
			error : whenErrorP
		});
	}

	function pageReview(s) {
		$.ajax({
			type : "post",
			url : "./manage_review.jsp",
			data : {
				page : s,
			},
			success : whenSuccessP,
			error : whenErrorP
		});
	}

	function pageParty(s) {
		$.ajax({
			type : "post",
			url : "./manage_party.jsp",
			data : {
				page : s,
			},
			success : whenSuccessP,
			error : whenErrorP
		});
	}

	function pageParty1(s) {
		$.ajax({
			type : "post",
			url : "./manage_party1.jsp",
			data : {
				page : s,
			},
			success : whenSuccessP,
			error : whenErrorP
		});
	}

	function pageQnA(s) {
		$.ajax({
			type : "post",
			url : "./manage_qna.jsp",
			data : {
				page : s,
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
		<%
			partyService ps = new partyService();
			String title = request.getParameter("title");

			if (title.equals("comment")) {
				
				List<resdatDTO> rd = ps.resdatall(request, response); // 아이디에 맞는 신청한 파티 들고오기
				
				
				if (rd != null) {
					
					int count = (rd.size() / 20);
					int c = rd.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (rd.size() / 20) + 1;
					}
		%>
		
		
		<!--  파티 신청 글이나 게시판 작성한 글 -->
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="6" style="text-align: center;">[댓글]</th>
				</tr>
				<tr>
					<th>식당이름</th>
					<th>작성자</th>
					<th>음식평</th>
					<th style="width: 50%;">내용</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					

						
							for (int i = 0; i < rd.size(); i++) {
				%>
				<tr>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getStore()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getNick()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"> <%
								for (int k = 0; k < rd.get(i).getPyung(); k++) {
							%>★<%
								}
							%>
					</a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDcontent()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rd.get(i).getRnum()%>"><%=rd.get(i).getDate()%></a></td>
						<td><a href="javascript:deleteresdat('<%=rd.get(i).getDnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>
				<%
					}
				%><tr>
					<td colspan="6" style="text-align: center;">
						<%
							for (int k = 0; k < num; k++) {
						%>
						<button class="btn btn-success" onClick="pageResdat('<%=k + 1%>')"><%=k + 1%></button>
						<%
							}
									if (count >= 1) {
						%>
						<button class="btn btn-success" onClick="pageResdat('11')">▶</button>
						<%
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>

		<%
			} else {
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="6" style="text-align: center;">[댓글]</th>
				</tr>
				<tr>
					<th>식당이름</th>
					<th>작성자</th>
					<th>음식평</th>
					<th style="width: 50%;">내용</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6" style="color: red;">작성된 댓글이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>


		<%
			} else if (title.equals("party")) {
				
				List<PartyDTO> pt = ps.partyall(request, response); // 아이디에 맞는 신청한 파티 들고오기
				

				if (pt != null) {
					int count = (pt.size() / 20);
					int c = pt.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (pt.size() / 20) + 1;
					}
		%>
		
		
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[모집중인 파티]</th>
				</tr>
				<tr>
					<th style="width: 55%;">제목</th>
					<th>주최자</th>
					<th>예상가격</th>
					<th>파티날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					
							for (int i = 0; i < pt.size(); i++) {
				%>
				<tr>
					<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getTitle()%></a></td>
					<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getNick()%></a></td>
					<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getPreprice()%></a></td>
					<td><a href="partyinfo.do?pnum=<%=pt.get(i).getPnum()%>"><%=pt.get(i).getPdate()%></a></td>
					<td><a href="javascript:deleteparty('<%=pt.get(i).getPnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>
				<%
					}
				%><tr>
					<td colspan="5" style="text-align: center;">
						<%
							for (int k = 0; k < num; k++) {
						%>
						<button class="btn btn-success" onClick="pageParty('<%=k + 1%>')"><%=k + 1%></button>
						<%
							}
									if (count >= 1) {
						%>
						<button class="btn btn-success" onClick="pageParty('11')">▶</button>
						<%
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>

		<%
			} else {
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[모집중인 파티]</th>
				</tr>
				<tr>
					<th style="width: 55%;">제목</th>
					<th>주최자</th>
					<th>예상가격</th>
					<th>파티날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="color: red;">현재 모집중인 파티가 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>


		<%
			} else if (title.equals("party1")) {
				
				List<PartyDTO> ptt = ps.party1all(request, response); // 아이디에 맞는 신청한 파티 들고오기
				
				if (ptt != null) {
					int count = (ptt.size() / 20);
					int c = ptt.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (ptt.size() / 20) + 1;
					}

		%>
		
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[완료된 파티]</th>
				</tr>
				<tr>
					<th style="width: 55%;">제목</th>
					<th>주최자</th>
					<th>예상가격</th>
					<th>파티날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					
							for (int i = 0; i < ptt.size(); i++) {
				%>
				<tr>
					<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getTitle()%></a></td>
					<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getNick()%></a></td>
					<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPreprice()%></a></td>
					<td><a href="partyinfore.do?pnum=<%=ptt.get(i).getPnum()%>"><%=ptt.get(i).getPdate()%></a></td>
					<td><a href="javascript:deleteparty('<%=ptt.get(i).getPnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>
				<%
					}
				%><tr>
					<td colspan="5" style="text-align: center;">
						<%
							for (int k = 0; k < num; k++) {
						%>
						<button class="btn btn-success" onClick="pageParty1('<%=k + 1%>')"><%=k + 1%></button>
						<%
							}
									if (count >= 1) {
						%>
						<button class="btn btn-success" onClick="pageParty1('11')">▶</button>
						<%
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>

		<%
			} else {
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[완료된 파티]</th>
				</tr>
				<tr>
					<th style="width: 55%;">제목</th>
					<th>주최자</th>
					<th>예상가격</th>
					<th>파티날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="color: red;">모집했던 파티가 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>


		<%
			} else if (title.equals("review")) {
				
				List<ReviewBean> rb = ps.reviewall(request, response);

				if (rb != null) {
					int count = (rb.size() / 20);
					int c = rb.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (rb.size() / 20) + 1;
					}
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[ 리뷰 ]</th>
				</tr>
				<tr>
					<th>작성자</th>
					<th style="width: 65%;">제목</th>
					<th>지역</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<%
					
							for (int i = 0; i < rb.size(); i++) {
				%>
				<tr>
					<td><a
						href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getNick()%></a></td>
					<td><a
						href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getRtitle()%></a></td>
					<td><a
						href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getLocation()%></a></td>
					<td><a
						href="reviewDetail.bo?board_num=<%=rb.get(i).getRnum()%>&page=1"><%=rb.get(i).getDate()%></a></td>
						<td><a href="javascript:deletereview('<%=rb.get(i).getRnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>

				<%
					}
				%><tr>
					<td colspan="5" style="text-align: center;">
						<%
							for (int k = 0; k < num; k++) {
						%>
						<button class="btn btn-success" onClick="pageReview('<%=k + 1%>')"><%=k + 1%></button>
						<%
							}
									if (count >= 1) {
						%>
						<button class="btn btn-success" onClick="pageReview('11')">▶</button>
						<%
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>

		<%
			} else {
				System.out.println("kk");
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="5" style="text-align: center;">[ 리뷰 ]</th>
				</tr>
				<tr>
					<th>작성자</th>
					<th style="width: 65%;">제목</th>
					<th>지역</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="color: red;">아직 작성한 리뷰가 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>


		<%
			} else if (title.equals("QnA")) {
				
				List<BoardBean> bb = ps.QnAall(request, response);
				
				if (bb != null) {
					int count = (bb.size() / 20);
					int c = bb.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (bb.size() / 20) + 1;
					}

		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="4" style="text-align: center;">[ Q_A ]</th>
				</tr>
				<tr>
					<th>작성자</th>
					<th style="width: 65%;">제목</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					
							for (int i = 0; i < bb.size(); i++) {
				%>

				<tr>
					<td><a
						href="boardDetail.bo?board_num=<%=bb.get(i).getQnum()%>&page=1&id=<%=bb.get(i).getId()%>"><%=bb.get(i).getNick()%></a></td>
					<td><a
						href="boardDetail.bo?board_num=<%=bb.get(i).getQnum()%>&page=1&id=<%=bb.get(i).getId()%>"><%=bb.get(i).getQtitle()%></a></td>
					<td><a
						href="boardDetail.bo?board_num=<%=bb.get(i).getQnum()%>&page=1&id=<%=bb.get(i).getId()%>"><%=bb.get(i).getDate()%></a></td>
						<td><a href="javascript:deleteqna('<%=bb.get(i).getQnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>

				<%
					}
				%><tr>
					<td colspan="4" style="text-align: center;">
						<%
							for (int k = 0; k < num; k++) {
						%>
						<button class="btn btn-success" onClick="pageQnA('<%=k + 1%>')"><%=k + 1%></button>
						<%
							}
									if (count >= 1) {
						%>
						<button class="btn btn-success" onClick="pageQnA('11')">▶</button>
						<%
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>

		<%
			} else {
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="4" style="text-align: center;">[ Q_A ]</th>
				</tr>
				<tr>
					<th>작성자</th>
					<th style="width: 65%;">제목</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4" style="color: red;">아직 작성한 Q_A가 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>


		<%
			} else if (title.equals("restau")) {
				
				List<DTO_AD> rs = ps.restauall(request, response);

				

				if (rs != null) {
					int count = (rs.size() / 20);
					int c = rs.size() % 20;
					int num;
					if (count >= 1) {
						num = 10;
					} else {
						num = (rs.size() / 20) + 1;
					}
		%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
			<thead>
				<tr>
					<th colspan="7" style="text-align: center;">[등록된 식당]</th>
				</tr>
				<tr>
					<th>식당번호</th>
					<th>등록인</th>
					<th>식당종류</th>
					<th>지역</th>
					<th>식당이름</th>
					<th style="width: 55%;">주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					
							for (int i = 0; i < 20; i++) {
				%>

				<tr>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getRnum()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getId()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getType()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getLocation() %></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>"><%=rs.get(i).getStore()%></a></td>
					<td><a
						href="restaurantDetail.bo?rnum=<%=rs.get(i).getRnum()%>">(<%=rs.get(i).getPostnum() %>)<%=rs.get(i).getHome() %>&nbsp;&nbsp;<%=rs.get(i).getDethome() %></a></td>
						<td><a href="javascript:deleterestau('<%=rs.get(i).getRnum() %>')"><input type="button" value="삭제"></a></td>
				</tr>




				<%}%><tr>
					<td colspan="7" style="text-align: center;" >
						<%for(int k =0; k<num; k++){%>
						<button class="btn btn-success" onClick="pageRestau('<%=k+1%>')"><%=k+1 %></button>
						<% }if(count>=1){%>
						<button class="btn btn-success" onClick="pageRestau('11')">▶</button>
						<%} %>
					</td>
				</tr>
			</tbody>
		</table>

		<%}else{%>
		<table class="table table-striped" style="margin-top: 10px;" id="rest">
		<thead>
				<tr>
					<th colspan="7" style="text-align: center;">[등록된 식당]</th>
				</tr>
				<tr>
					<th>식당번호</th>
					<th>등록인</th>
					<th>식당종류</th>
					<th>지역</th>
					<th>식당이름</th>
					<th style="width: 55%;">주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="7" style="color: red;">아직 등록된 식당이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<%} %>





		<%}%>



	</div>



</body>
</html>
