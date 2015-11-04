<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Requests</title>
    
 <link type="text/css" rel="stylesheet" href="jdeveloper.css"/>
    
    <style>
/* unvisited link */
a:link {
    color:ActiveCaption;
    font:normal ;
}

/* visited link */
a:visited {
    color:Gray;
}

/* mouse over link */
a:hover {
    color: #FF00FF;
}

/* selected link */
a:active {
    color: #0000FF;
}
</style>
    
  </head>
  <body>
   <h2 align="center"
   style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;" >
      Requests
    </h2><h3>
   
    <a href="Employees.jsp">  Employees Data </a>
    </h3>
    <p>
       
      <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
       
    </p>
    <% String usrid = null;
usrid = (String) session.getAttribute("userid");
if (usrid == null){%>
    <jsp:forward page="login.jsp"/>
    <% } %>
   
    
    
      <%java.sql.ResultSet rset;
      Integer employee_id = new Integer(request.getParameter("empid"));
      
      if (employee_id != null )
      rset = empsbean.getAllRequestsByEmployeeID(employee_id.intValue());
      else rset = empsbean.getAllEmployeeRequests();
      java.sql.ResultSet lev_set = empsbean.getLeaveBalanceByEmployeeID(employee_id.intValue());
     
     %>
    </p>
    <p>
      Leave Balance is <% while (lev_set.next() ) out.println( lev_set.getInt(1)); %>
    </p>
    
    <table cellspacing="2" cellpadding="3" border="1" width="100%">
  <tr>
    <td width="17%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">First Name</td>
    <td width="17%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Last Name</td>
    <td width="17%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Request Type</td>
    <td width="17%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">From Date</td>
    <td width="16%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">To Date</td>
    <td width="16%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Status</td>
    <td width="16%" style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">
     <% out.println("<a href = insertRequest.jsp?empid=" + employee_id.intValue() + "> New Request </a>"); %>
     </td>
  </tr>

   <%while (rset.next ())
{
out.println("<tr>");
out.println("<td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getString("first_name") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getString("last_name") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getString("type") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getDate("FromDate") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getDate("ToDate") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Arial;\">" +
rset.getString("Status") + " </td><td  >");

String usrsession = (String)(session.getAttribute("userid"));
Integer manager = (Integer)(session.getAttribute("manager"));
Integer managerset = rset.getInt("Manager_ID");

if (managerset.intValue() == Integer.parseInt(usrsession) ){
out.println("<a href=\"editRequest.jsp?reqid=" +rset.getInt(1)+ "\">Edit</a>");
}
if (!(rset.getString("Status")).equals("Approved") && Integer.parseInt(usrsession) == employee_id.intValue() ){
out.println("<a href=\"deleteRequest_action.jsp?reqid=" +rset.getInt(1)+ "&empid=" + employee_id.intValue() + "\">Delete</a>");
}


out.println(" </td></tr>");
}%>
    </table>
  </body>
</html>