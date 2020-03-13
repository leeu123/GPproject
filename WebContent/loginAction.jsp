<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="member.MemberDAO" %> <!--jsp페이지에서 java파일을 사용하기 위해선 이문장이 필요하다 /우리가 만든  DAOclass를 가지고오는 문장이다. -->	
<%@ page import ="java.io.PrintWriter" %><!-- 자바스크립트 문장을 사용하기 위한 문장 -->
<%
	request.setCharacterEncoding("UTF-8");
%> <!-- 넘어오는 모든 데이터를 utf-8로 변환해주는 문장 -->
<jsp:useBean id ="dto" class="member.MemberDTO" scope="page"/> <!-- user라는 아이디를 만들어주고  현재 페이지에서만 빈즈를 사용한다는 의미의 scope page를 넣어준다 -->
<jsp:setProperty name ="dto" property ="id"/> <!-- MemberDTO클래스를 사용하기 위한변수 dto를 만들고  DTO에 id pw값을 set해줌-->
<jsp:setProperty name = "dto" property ="pw"/>

<!DOCTYPE html>
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
     int result = userDAO.login(dto.getId(),dto.getPw());
     
 
         if(result ==1){
        	 String nick = userDAO.selectNick(dto.getId());
        	if(nick != null){
        	 session.setAttribute("id",dto.getId());
        	 session.setAttribute("nick",nick);
        	 PrintWriter script = response.getWriter();
        	 script.println("<script>");
        	script.println("location.href = 'gpindex.jsp'");
        	 script.println("</script>");
        	}else{
        		 PrintWriter script = response.getWriter();
            	 script.println("<script>");
            	 script.println("alert('nick을 가져오는데 실패했습니다.')");
            	 script.println("</script>");
        	}
         }else if(result ==0){
        	 PrintWriter script = response.getWriter(); 
        	 script.println("<script>");
        	 script.println("alert('비밀번호가 틀립니다.')");
        	 script.println("history.back()"); 
        	 script.println("</script>");
        	 
         }else if(result == -1){
        	 PrintWriter script = response.getWriter(); 
        	 script.println("<script>");
        	 script.println("alert('아이디가 존재하지 않습니다.')");
        	 script.println("history.back()"); 
        	 script.println("</script>");
        	 
         }else if(result == -2){
        	 PrintWriter script = response.getWriter(); 
        	 script.println("<script>");
        	 script.println("alert('데이터베이스 오류가 발생 했습니다')");
        	 script.println("history.back()"); 
        	 script.println("</script>");
        	 
         }
%>
</body>
</html>
