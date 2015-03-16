<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>delete_action</title>
  </head>
  <body>
  <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
   <%Integer employee_id =
new Integer(request.getParameter("empid"));

empsbean.deleteEmployeeById(employee_id.intValue());%>
 <jsp:forward page="Employees.jsp"/>
  </body>
</html>