<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>deleteRequest_action</title>
  </head>
  <body>
   <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
   <%Integer employee_id =
new Integer(request.getParameter("empid"));
Integer req_id = new Integer(request.getParameter("reqid"));

empsbean.deleteRequestById(req_id.intValue());%>
 <jsp:forward page="<%= \"Request1.jsp?empid=\" + employee_id.intValue() %>"/>
  </body>
</html>