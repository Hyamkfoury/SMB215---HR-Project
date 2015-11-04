<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>update_action</title>
  </head>
  <body>
    <%@ page import="java.sql.ResultSet" %>
   
    <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
    <%Integer employee_id = new Integer(request.getParameter("employee_id"));
    Integer request_id = new Integer(request.getParameter("request_id"));
String type = request.getParameter("type");
String from_date = request.getParameter("From_Date");
String to_date = request.getParameter("To_Date");
String note = request.getParameter("note");
String status = request.getParameter("status");

empsbean.updateRequest(employee_id.intValue(), request_id.intValue(), type, from_date , to_date , note, status );%>

 <jsp:forward page="<%= \"Request1.jsp?empid=\" + employee_id.intValue() %>"/>
  </body>
  
</html>