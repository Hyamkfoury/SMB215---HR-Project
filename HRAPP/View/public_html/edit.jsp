<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>edit</title>
  </head>
  <body>
    <h2 align="center">
      HR Application
    </h2><h3 align="left">
      Edit Employee Record
    </h3>
    <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
    <jsp:useBean id="employee" class="hr.Employee" scope="page" >
<%Integer employee_id = new Integer(request.getParameter("empid"));
employee = empsbean.findEmployeeById(employee_id.intValue());%>
    </jsp:useBean>
    <form action="update_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">First Name</td>
          <td width="50%">
          <input type="hidden" name="employee_id"
                   value="<%=employee.getEmployeeId() %>"/>
                   
            <input type="text" name="first_name"
                   value="<%=employee.getFirstName() %>" />
                   </td> 
                   </tr><tr>
    
          <td width="50%">Last Name</td>
          <td width="50%">
            <input type="text" name="last_name"
                   value="<%= employee.getLastName() %>" />
          </td>
        </tr><tr>
          <td width="50%">Email</td>
          <td width="50%">
            <input type="text" name="email" value="<%= employee.getEmail() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Phone</td>
          <td width="50%">
            <input type="text" name="phone_number"
                   value="<%= employee.getPhoneNumber() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Job</td>
          <td width="50%">
            <input type="text" name="job_id"
                   value="<%= employee.getJobId() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Monthly Salary</td>
          <td width="50%">
            <input type="text" name="salary"
                   value="<%= employee.getSalary() %>"/>
          </td>
        </tr>
      </table>
      <input type="submit" value="Update"/>
    
  </body>
</html>