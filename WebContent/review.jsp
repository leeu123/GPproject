<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="review.reviewDAO"%>
<%@ page import="review.reviewDTO"%>
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
<jsp:useBean id="review" class="review.reviewDTO" scope="page" />
<jsp:setProperty name="review" property="content" />
<jsp:setProperty name="review" property="nick" />
<jsp:setProperty name="review" property="pyung" />
<!-- 값 입력해주는 jsp usebean 태그 -->
<jsp:useBean id="redao" class="review.reviewDAO" scope="page" />

</head>
<body>
	<%
		redao.entdb();
		int rs = redao.write(review.getPyung(), review.getNick(), review.getContent());

		if (rs != 0) {
			out.println("<script>");
			out.println("alert('오류가 있어요1412415');");
			out.println("</script>");
		}
	%>
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
				ArrayList<reviewDTO> hl = hdao.getList();
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