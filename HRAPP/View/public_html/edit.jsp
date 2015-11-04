<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>edit</title>
  </head>
  <body>
    <h2 align="center" 
    style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;" >
      HR Application
    </h2><h3 align="left" style="color:Navy; font-weight:bold;">
     <a href="Employees.jsp"> Edit Employee Record </a>
    </h3>
    <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
    <jsp:useBean id="employee" class="hr.Employee" scope="page" >
    
     <% String usrid = null;
usrid = (String) session.getAttribute("userid");
if (usrid == null){%>
    <jsp:forward page="login.jsp"/>
    <% } %>
    
<%Integer employee_id = new Integer(request.getParameter("empid"));
employee = empsbean.findEmployeeById(employee_id.intValue());%>
    </jsp:useBean>
    <form action="update_action.jsp" style="color:Navy;">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%"
              style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">First Name</td>
          <td width="50%">
          <input type="hidden" name="employee_id"
                   value="<%=employee.getEmployeeId() %>"/>
                   
            <input type="text" name="first_name"
                   value="<%=employee.getFirstName() %>"
                   style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
                   </td> 
                   </tr><tr>
    
          <td width="50%"
              style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Last Name</td>
          <td width="50%">
            <input type="text" name="last_name"
                   value="<%= employee.getLastName() %>"
                   style="color:Navy; width:300px; height:25%; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%"
              style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Email</td>
          <td width="50%">
            <input type="text" name="email" value="<%= employee.getEmail() %>"
                   style="color:Navy; width:300px; height:25%; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Phone</td>
          <td width="50%">
            <input type="text" name="phone_number"
                   value="<%= employee.getPhoneNumber() %>"
                   style="color:Navy; width:300px; height:25%; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%"style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;" >Job</td>
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
            <script language="javascript">
             document.getElementById("<%= employee.getJobId() %>").selected = 'selected';
            </script>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Monthly Salary</td>
          <td width="50%">
            <input type="text" name="salary"
                   value="<%= employee.getSalary() %>"
                   style="color:Navy; width:300px; height:25%; font-family:Arial;"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Update"
             style="color:Navy; font-weight:bold;"/>
    
  </body>
</html>