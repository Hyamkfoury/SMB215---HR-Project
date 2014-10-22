<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Requests</title>
  </head>
  <body>
   <h2 align="center">
      Requests
    </h2><h3>
      Employees Data
    </h3>
    <p>
       
      <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
       
    </p>
   
    <form action="Requests.jsp">
      Filter by Request Type <input type="text" name="query"/>
      <input type="submit" value="Filter"/>
    </form>
    <p>
    
    
    
      <%java.sql.ResultSet rset;
      Integer employee_id = new Integer(request.getParameter("empid"));
      
      if (employee_id != null )
      rset = empsbean.getAllRequestsByEmployeeID(employee_id.intValue());
      else rset = empsbean.getAllEmployeeRequests();
     %>
    </p>
    <p>
      &nbsp;
    </p>
    
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
  <tr>
    <td width="17%">First Name</td>
    <td width="17%">Last Name</td>
    <td width="17%">Request Type</td>
    <td width="17%">From Date</td>
    <td width="16%">To Date</td>
    <td width="16%">Status</td>
     <td width="16%">
     <% out.println("<a href = insertRequest.jsp?empid=" + employee_id.intValue() + "> New Request </a>"); %>
     </td>
  </tr>

   <%while (rset.next ())
{
out.println("<tr>");
out.println("<td>" +
rset.getString("first_name") + "</td><td>" +
rset.getString("last_name") + "</td><td>" +
rset.getString("type") + "</td><td>" +
rset.getString("FromDate") + "</td><td>" +
rset.getString("ToDate") + "</td><td>" +
rset.getString("Status") + 
" </td><td> <a href=\"editRequest.jsp?reqid=" +rset.getInt(1)+
"\">Edit</a>  <a href=\"deleteRequest_action.jsp?reqid=" +rset.getInt(1)+
"\">Delete</a>  </td>");

out.println("</tr>");
}%>
    </table>
  </body>
</html>