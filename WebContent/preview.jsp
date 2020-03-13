<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="controll.partyService"%>
<%@ page import="party.Preview"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 값 입력해주는 jsp usebean 태그 -->
<jsp:useBean id="preview" class="party.Preview" scope="page" />
<jsp:setProperty name="preview" property="*" />
<%
	partyService sv = new partyService();
	boolean bl = sv.insePreview(request, response);
	if (bl != true) {
		out.println("<script>");
		out.println("alert('입력에 오류가 있습니다.')");
		out.println("location.href='party_infore.jsp'");
		out.println("</script>");
	}
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