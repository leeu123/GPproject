<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="party.Preview"%>
<%@ page import="controll.partyService"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped">
		<thead>
			<tr>

				<th>작성자</th>
				<th style="width: 75%;">내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
				partyService sv = new partyService();
					ArrayList<Preview> hl = sv.selelistPreview(request, response);
					if (hl != null) {
						for (int i = 0; i < hl.size(); i++) {
			%>
			<tr>

				<td><%=hl.get(i).getNick()%></td>
				<td><%=hl.get(i).getRcontent()%></td>
				<td><%=hl.get(i).getDate()%></td>
			</tr>
			<%
				}
				} else {
			%><tr>
				<td colspan="3"><font style="color: red;">작성된 파티 후기가
						없습니다.</font></td>
			</tr>
			<%
				}
			%>



		</tbody>
	</table>

</body>
</html>