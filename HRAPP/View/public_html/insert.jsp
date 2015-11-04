<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insert</title>
  </head>
  <body>
    <h3 align="center"
     style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;">
      HR Application
    </h3><h3
    style="color:Navy; font-weight:bold; font-style:italic;">
      Insert Employee Record
    </h3>
    <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
    <form action="insert_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">First Name</td>
          <td width="50%">
            <input type="text" name="first_name" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Last Name</td>
          <td width="50%">
            <input type="text" name="last_name"style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Email</td>
          <td width="50%">
            <input type="text" name="email"style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Phone</td>
          <td width="50%">
            <input type="text" name="phone_number" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Job</td>
          <td width="50%">
             <select name="job_id"
                    style="width:306px; height:25%; color:Navy; font-family:Arial;">
                <% java.sql.ResultSet jobRSet;
                   jobRSet = empsbean.getAllJobId(); 
                while (jobRSet.next()) {
                    String strListItem = jobRSet.getString("Job_Id"); 
                    String jobTitle = jobRSet.getString("Job_Title");%>
                    <option id="<%= strListItem %>" value="<%= strListItem %>"
                            style="font-family:Arial;"><%= jobTitle %></option>
                <% } %>
            </select>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Monthly Salary</td>
          <td width="50%">
            <input type="text" name="salary" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr>
        <tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Password</td>
          <td width="50%">
            <input type="password" name="password" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr>
      </table>
       <input type="submit" value="Add Employee"style="color:Navy; font-weight:bold;"/>
    </form>
  </body>
</html>