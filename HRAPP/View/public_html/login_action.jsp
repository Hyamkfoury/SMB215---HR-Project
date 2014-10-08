<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>login_action</title>
  </head>
  <body><%@ page import="java.sql.ResultSet"%>
  <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
<%boolean userIsValid = false;
String host = request.getParameter("host");
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String jdbcUrl = "jdbc:oracle:thin:@" + host + ":1521:XE";
userIsValid = empsbean.authenticateUser(jdbcUrl, userid, password, session);%>
<%if (userIsValid){%><jsp:forward page="Employees.jsp"/><%}else%><jsp:forward page="login.jsp"/>%>
  </body>
</html>