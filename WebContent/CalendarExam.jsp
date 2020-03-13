<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

int action = 0; //up(1) down(0)
int currYear = 0;
int currMonth = 0;
String boxSize = "70";

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

if(request.getParameter("action") == null) {
    
     currMonth = c.get(Calendar.MONTH);
     currYear = c.get(Calendar.YEAR);
     cal.set(currYear,currMonth,1);
    
} else {
    
     if(request.getParameter("action") != null){
         
          currMonth = Integer.parseInt(request.getParameter("month"));
          currYear = Integer.parseInt(request.getParameter("year"));
         
          if(Integer.parseInt(request.getParameter("action"))==1) {

               cal.set(currYear, currMonth, 1);
               cal.add(Calendar.MONTH, 1); //다음달
               currMonth = cal.get(Calendar.MONTH);
               currYear = cal.get(Calendar.YEAR);
              
          } else {              

               cal.set(currYear, currMonth, 1);
               cal.add(Calendar.MONTH, -1); //이전달
               currMonth = cal.get(Calendar.MONTH);
               currYear = cal.get(Calendar.YEAR);         
          }
         
     }
}
System.out.println(currYear);
System.out.println(currMonth);
%>

<%!
     public boolean isDate(int y, int m, int d) {
    
          m -= 1;
          Calendar c = Calendar.getInstance();
          c.setLenient(false);
         
          try {
              
               c.set(y, m, d);
               Date dt = c.getTime();
              
          } catch(IllegalArgumentException e) {
               return false;
          }
          return true;
     }
%>

<%!
     public String getTitle(Calendar cal){
         
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월");
          return sdf.format(cal.getTime());    
     }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 달력(Calendar)</title>
</head>
<body bgcolor='white'>
<table border='1' width='519' celpadding='0' cellspacing='0'>
  <tr>
     <td width='150' align='right' valign='middle'><a href="CalendarExam.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="2">이전달</font></a></td>
     <td width='260' align='center' valign='middle'><b><%= getTitle(cal)%></b></td>
     <td width='173' align='left' valign='middle'><a href="CalendarExam.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="2">다음달</font></a></td>
  </tr>
</table>
<table border="0" width="520" bordercolorlight="#C0C0C0"
          bordercolordark="#808080" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
  <tr>         
  <td width="100%">
    <table border="2" width="519" bordercolorlight="#C0C0C0" bordercolordark="#000000" style="border-collapse: collapse" bordercolor="#000000" cellpadding="0" cellspacing="0" bgcolor="#DFDCD8">
       <tr>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>일</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>월</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>화</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
             <font color="#FFFFFF"><b>수</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>목</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>금</b></font></td>
              <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
              <font color="#FFFFFF"><b>토</b></font></td>
       </tr>
<%

//'Calendar loop


     int currDay;
     String todayColor;
     int count = 1;
     int dispDay = 1;


     for (int w = 1; w < 7; w++)
     {
%>
       <tr>
<%
            for (int d = 1; d < 8; d++)
          {
               if (! (count >= cal.get(Calendar.DAY_OF_WEEK)))
               {

%>
          <td width="<%=boxSize%>" height="<%=boxSize%>" valign="top" align="left">&nbsp;</td>
<%
                    count += 1;
               }
               else
               {

                    if (isDate (currYear, currMonth + 1,dispDay) ) // use the isDate method
                    {

                         //오늘
                         if ( dispDay == c.get(Calendar.DAY_OF_MONTH) && c.get(Calendar.MONTH) == cal.get(Calendar.MONTH) && c.get(Calendar.YEAR) == cal.get(Calendar.YEAR))
                         {
                             todayColor = "#6C7EAA";
                         }
                         else
                         {
                             todayColor = "#ffffff";
                         }
%>
          <td bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top"><%=dispDay%><br>
          </td><%
                         count += 1;
                         dispDay += 1;
                    }
                    else
                    {
%>
          <td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>
<%
                    }
               }

       }
%>
       </tr>
<%
}
%>
     </table>
     </td>
     </tr>
  </table>
</body>
</html>
