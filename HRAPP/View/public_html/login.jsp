<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>login</title>
  </head>
  <body>
    <h3 align="center">
      HR Application
    </h3><h3>
      Application Login
    </h3>
    <form action="login_action.jsp">
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
      <tr>
        <td width="50%">User ID</td>
        <td width="50%"><input type="text" name="userid"></td>
      </tr><tr>
        <td width="50%">Password</td>
        <td width="50%"><input type="password" name="password"></td>
      </tr><tr>
        <td width="50%">Host</td>
        <td width="50%"><input type="text" name="host"></td>
      </tr>
    </table>
    
      <input type="submit" value="Submit"/>
    </form>
    
    <% String loginerrormsg = null;
loginerrormsg = (String) session.getAttribute("loginerrormsg");
if (loginerrormsg != null){%>
    <%= loginerrormsg %>
    <% } %>
  </body>
</html>