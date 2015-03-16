<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Employees</title>
    <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
  </head>
  <body>
    <h2 align="center">
      HR Application
    </h2><h3>
      Employees Data
    </h3>
    <p>
       
      <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
       
    </p>
   
    <form action="Employees.jsp">
      Filter by Employee Name <input type="text" name="query"/>
      <input type="submit" value="Filter"/>
    </form>
    <p>
    
    
    
      <%java.sql.ResultSet rset;
      String query = request.getParameter("query"); 
      if (query != null )
      rset = empsbean.getAllEmployeesByName(query);
      else rset = empsbean.getAllEmployees();%>
    </p>
    <p>
      &nbsp;
    </p>
    
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
  <tr>
    <td width="17%">First Name</td>
    <td width="17%">Last Name</td>
    <td width="17%">Email</td>
    <td width="17%">Job</td>
    <td width="16%">Phone</td>
    <td width="16%">Salary</td>
     <td width="16%">
          <a href="insert.jsp">Insert Employee</a>
        </td>
  </tr>
   <%while (rset.next ())
{
out.println("<tr>");
out.println("<td>" +
rset.getString("first_name") + "</td><td>" +
rset.getString("last_name") + "</td><td>" +
rset.getString("email") + "</td><td>" +
rset.getString("job_id") + "</td><td>" +
rset.getString("phone_number") + "</td><td>" +
rset.getDouble("salary") + 
" </td><td> <a href=\"edit.jsp?empid=" +rset.getInt(1)+
"\">Edit</a>  <a href=\"delete_action.jsp?empid=" +rset.getInt(1)+
"\">Delete</a>  </td>");

out.println("</tr>");
}%>
    </table> 
  </body>
</html>
