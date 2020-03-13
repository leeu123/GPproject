
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath = request.getRealPath("/upload");
	int size = 10*1024*1024;
    
	String title="";
	String location="";
	String content="";
	String filename="";
	String origfilename="";
	int number = Integer.parseInt(request.getParameter("number"));
	String file = (String)request.getParameter("origfilename");
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());		
		
		title=multi.getParameter("title");
		location=multi.getParameter("location");
		content=multi.getParameter("content");
		Enumeration files =multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename= multi.getFilesystemName(file1);
		origfilename= multi.getOriginalFileName(file1);
	
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>

 <% 
 request.setAttribute("title", title);
 request.setAttribute("content", content);
 request.setAttribute("location", location);
 request.setAttribute("filename", filename);
 request.setAttribute("origfilename", origfilename);
 
 RequestDispatcher dis = request.getRequestDispatcher("updateAction.jsp?number="+number+"&origfilename="+file);
 dis.forward(request, response);


 %>
</body>
</html>
