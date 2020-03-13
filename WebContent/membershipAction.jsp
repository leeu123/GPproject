<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 
id : JSP 페이지에서 자바빈 객체에 접글할 때 사용할 이름을 명시한다.
class : 패키지이름을 포함한 자바빈 클래스의 완전한 이름을 입력한다.
scope : 자바빈 객체가 저장될 영역을 지정한다. (page, request, session, application 중 하나, 기본값은 page)
 -->
<jsp:useBean id="dto" class="member.MemberDTO" scope="page" />
<jsp:setProperty name="dto" property="*" />
<!--  
<jsp:setProperty name="dto" property="nick" />
<jsp:setProperty name="dto" property="pw" />
<jsp:setProperty name="dto" property="pwhint" />
<jsp:setProperty name="dto" property="pwa" />
<jsp:setProperty name="dto" property="name" />
<jsp:setProperty name="dto" property="email" />
<jsp:setProperty name="dto" property="age" />
<jsp:setProperty name="dto" property="home" />
<jsp:setProperty name="dto" property="dethome" />
<jsp:setProperty name="dto" property="postnum" />
<jsp:setProperty name="dto" property="cell" />
<jsp:setProperty name="dto" property="sex" />
-->

<html>
<head>
<meta http-equive="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

	<%   
String id =null;     
if(session.getAttribute("id")!=null){  //로그인이 되어있는지를 확인하기위해서 세션이 셋 되어 있으면 아이디 변수에 로그인된 아이디를 저장해둔다
id = (String)session.getAttribute("id");  	  
}
	 MemberDAO userDAO = new MemberDAO(); 
     int result = userDAO.join(dto);
         if(result ==-1){
        	 //printwriter클래스
        	 PrintWriter script = response.getWriter();
        	 script.println("<script>");
        	 script.println("alert('이미존재하는 아이디입니다.')");
        	 script.println("history.back()"); 
        	 script.println("</script>");
        	 
         }else if(result == 1){
        	 
        	 session.setAttribute("id",dto.getId());
        	 session.setAttribute("nic",dto.getNick());
        	 PrintWriter script = response.getWriter();
     
        	 script.println("<script>");
 
        	 script.println("location.href = 'gpindex.jsp'");	 

        	 script.println("</script>");
        	 
         }

%>
</body>
</html>
