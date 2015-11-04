<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insert_action</title>
  </head>
  <body>
  <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
   <%String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String email = request.getParameter("email");
String phone_number = request.getParameter("phone_number");
String job_id = request.getParameter("job_id");
Integer salary = new Integer(request.getParameter("salary"));
String password = request.getParameter("password");
empsbean.addEmployee(first_name, last_name, email, phone_number, job_id, salary.intValue(),password);%>
    <jsp:forward page="Employees.jsp"/>
  </body>
 
</html>