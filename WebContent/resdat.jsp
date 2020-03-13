<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="resdat.resdatDAO"%>
<%@ page import="resdat.resdatDTO"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
<jsp:useBean id="review" class="resdat.resdatDTO" scope="page" />
<jsp:setProperty name="review" property="*" />
<!-- 값 입력해주는 jsp usebean 태그 -->
<jsp:useBean id="redao" class="resdat.resdatDAO" scope="page" />

</head>
<body>
	<%
		redao.entdb();
		int rs = redao.write(review.getPyung(), review.getId(), review.getRnum(), review.getNick(),
				review.getDcontent());

		if (rs != 0) {
			out.println("<script>");
			out.println("alert('오류가 있어요1412415');");
			out.println("</script>");
		}
	%>
	<table class="table table-striped">
		<thead>
			<tr>

				<th>작성자</th>
				<th>음식평</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>

			<%
				resdatDAO hdao = new resdatDAO();
				ArrayList<resdatDTO> hl = hdao.getList(review.getRnum());
				for (int i = 0; i < hl.size(); i++) { //
			%>
			<tr>

				<td><%=hl.get(i).getNick()%></td>
				<td>
					<%
						for (int h = 1; h <= hl.get(i).getPyung(); h++) {
					%>★<%
						}
					%>
				</td>

				<td style="width: 61%;"><%=hl.get(i).getDcontent()%></td>
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