<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Employees</title>
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
  <body style="color:Navy; font-family:Calibri; font-size:small;">
    <h2 align="center"
        style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;" >
      HR Application
    </h2><h3
      style="color:Navy; font-size:x-large; font-weight:bold; text-align:left; font-style:italic;">
      Employees Data
    </h3>

       <%@ page import = "com.cdyne.ws.weatherws.Weather" %>
        <%@ page import = "com.cdyne.ws.weatherws.WeatherSoap" %>
      <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
       
    <% String usrid = null;
usrid = (String) session.getAttribute("userid");
if (usrid == null){%>
    <jsp:forward page="login.jsp"/>
    <% } %>
    <form action="Employees.jsp"
          style="color:Navy; font-weight:normal; font-size:large; font-family:Calibri; font-style:italic;text-align:right;">
      Filter by Employee Name <input type="text" name="query"/>
      <input type="submit" value="Filter" style="font-size:large;"/>
    </form>
    <p>
    
    
    
      <%java.sql.ResultSet rset;
      String query = request.getParameter("query");
      Weather service = new Weather();
      WeatherSoap port = service.getWeatherSoap();
      out.println("<h2> Tempreture from Weather web service is " + (port.getCityWeatherByZIP("29063")).getTemperature() + "</h2>");
      
      if (query != null )
      rset = empsbean.getAllEmployeesByName(query);
      else rset = empsbean.getAllEmployees();%>
    </p>
    <p>
      &nbsp;
    </p>
    
    <table cellspacing="2" cellpadding="3" border="1" width="97%"
           style="color:Navy; font-family:Calibri; font-size:medium; background-repeat:no-repeat;">
  <tr>
    <td width="76"
        style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">First Name</td>
    <td width="78"
        style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Last Name</td>
    <td width="72"
        style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Email</td>
    <td width="67"
        style="color:White; font-style:italic; font-weight:bold; background-color:ActiveBorder;">Job</td>
    <td width="80"
        style="color:White; font-weight:bold; font-style:italic; background-color:ActiveBorder;">Phone</td>
    <td width="79"
        style="color:White; font-style:italic; font-weight:bold; background-color:ActiveBorder;">Salary</td>
    <td width="71"
        style="color:White; font-style:italic; font-weight:bold; background-color:ActiveBorder;">Requests</td>
    <td width="40"
        style="color:White; font-style:italic; font-weight:bold; background-color:ActiveBorder;">Jobs</td>
     <td width="88"
         style="color:White; font-weight:bolder; font-style:italic; background-color:ActiveBorder;">
          <a href="insert.jsp">Insert Employee</a>
        </td>
  </tr>
   <%while (rset.next ())
{
out.println("<tr style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\" >");
out.println("<td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getString("first_name") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getString("last_name") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getString("email") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getString("JOB_TITLE") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getString("phone_number") + "</td><td style=\"color:Navy; font-weight:normal; font-size:SMALL; font-family:Calibri;\">" +
rset.getDouble("salary") + 
" </td><td  > <a href=\"Request1.jsp?empid=" +rset.getInt(1)+ "\">Requests</a>" +
" </td><td> <a href=\"History.jsp?empid=" +rset.getInt(1)+ "\">History</a>" +
" </td><td>");
Integer usrset = rset.getInt(1);
String usrsession = (String)(session.getAttribute("userid")); 
Integer manager = (Integer)(session.getAttribute("manager"));
Integer managerset = rset.getInt("Manager_ID");

if (usrset.intValue() == Integer.parseInt(usrsession )){
out.println("<a href=\"edit.jsp?empid=" +rset.getInt(1)+ "\">Edit</a>"); 
}

if (managerset.intValue() == Integer.parseInt(usrsession )){
out.println("<a href=\"delete_action.jsp?empid=" +rset.getInt(1)+ "\">Delete</a>"); 
}

if (managerset.intValue() == Integer.parseInt(usrsession )){
out.println("<a href=\"edit.jsp?empid=" +rset.getInt(1)+ "\">Edit</a>"); 
}
out.println( "</td>");

out.println("</tr>");
}%>
    </table> 
  </body>
</html>
