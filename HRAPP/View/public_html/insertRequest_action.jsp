<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insertRequest_action</title>
  </head>
  <body>
  <%@ page import="java.sql.Date" %>
   <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
   <%
   Integer employee_id =new Integer( request.getParameter("employee_id"));
   String type = request.getParameter("request_type");
String from_date =  request.getParameter("From_Date");
String to_date = request.getParameter("To_Date");
String note = request.getParameter("note");
empsbean.addRequest(type, employee_id.intValue(), from_date, to_date, note, "new");
   
    %>
    
     <jsp:forward page = "<%= \"Request1.jsp?empid=\" + employee_id.intValue() %>"/>
  </body>
</html>