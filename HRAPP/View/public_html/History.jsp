<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>History</title>
  </head>
  <body>
   <h2 style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top; text-align:center;" >
      Jobs History
    </h2><h3>
    <a href="Employees.jsp">  Employees Data </a>
    </h3>
    <p>
       
      <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
       
    </p>
   
   
    <p>
    
     <% String usrid = null;
usrid = (String) session.getAttribute("userid");
if (usrid == null){%>
    <jsp:forward page="login.jsp"/>
    <% } %>
    
      <%java.sql.ResultSet rset;
      Integer employee_id = new Integer(request.getParameter("empid"));
            
      rset = empsbean.getAllHistoryByEmployeeID(employee_id.intValue());
      
     %>
    </p>
    <p>
      &nbsp;
    </p>
    
    
    <table cellspacing="2" cellpadding="3" border="1" width="100%"
           style="color:Navy;">
  <tr style="background-color:ActiveBorder;">
    <td width="25%"
        style="font-weight:bold; background-color:ActiveBorder; color:White; font-style:italic;">Department Name</td>
    <td width="25%"
        style="font-weight:bold; color:White; background-color:ActiveBorder; font-style:italic;">Job Title</td>
    <td width="25%"
        style="font-weight:bold; color:White; background-color:ActiveBorder; font-style:italic;">Start Date</td>
    <td width="25%"
        style="font-weight:bold; color:White; background-color:ActiveBorder; font-style:italic;"> End Date</td>
    
  </tr>


   <%while (rset.next ())
{
out.println("<tr>");
out.println("<td>" +
rset.getString("DEPARTMENT_NAME") + "</td><td>" +
rset.getString("JOB_TITLE") + "</td><td>" +
rset.getDate("START_DATE") + "</td><td>" +
rset.getDate("END_DATE") + "</td></tr>");

}%>
    </table>
  </body>
</html>