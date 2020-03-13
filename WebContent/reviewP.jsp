<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="review.reviewDAO"%>
<%@ page import="review.reviewDTO"%>
<%
	request.setCharacterEncoding("utf-8");
String pyung = request.getParameter("pyung");
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
				<th>닉네임</th>
				<th>음식평</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
				reviewDAO hdao = new reviewDAO();
				ArrayList<reviewDTO> hl = hdao.getListP(pyung);
				for (int i = 0; i < hl.size(); i++) { //
			%>
			<tr>

				<td><%=hl.get(i).getNick()%></td>
				<td><%=hl.get(i).getPyung()%></td>

				<td style="width:61%;"><%=hl.get(i).getContent()%></td>
				<td><%=hl.get(i).getDate().substring(0, 11) + hl.get(i).getDate().substring(11, 13) + "시"
						+ hl.get(i).getDate().substring(14, 16) + "분"%></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>

</body>
</html>