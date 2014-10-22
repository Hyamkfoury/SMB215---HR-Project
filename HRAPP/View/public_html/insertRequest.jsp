<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insertRequest</title>
  </head>
  <body>
  <%Integer employee_id = new Integer(request.getParameter("empid")); %>
   <h3 align="center">
      HR Application
    </h3><h3>
      Insert Employee Request
    </h3><form action="insertRequest_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
        
         <input type="hidden" name="employee_id"
                   value="<%=employee_id.intValue() %>"/>
          <td width="50%">Request Type:</td>
          <td width="50%">
            <select size="1" name="request_type">
              <option value="LV_Ann">
                Annual Leave
              </option>
              <option value="LV_Sick">
                Sick Leave
              </option>
              <option value="LV_Half">
                Annual Leave - Half Day
              </option>
             </select>
          </td>
        </tr><tr>
          <td width="50%">From Date:</td>
          <td width="50%">
            <input type="text" name="from_date"/>
          </td>
        </tr><tr>
          <td width="50%">To Date:</td>
          <td width="50%">
            <input type="text" name="to_date"/>
          </td>
        </tr><tr>
          <td width="50%">Note</td>
          <td width="50%">
            <input type="text" name="note"/>
          </td>
        </tr>
      </table>
       <input type="submit" value="Add Request"/>
    </form>
  
  </body>
</html>