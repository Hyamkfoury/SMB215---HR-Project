<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insertRequest</title>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
   
   <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
   $(function() {
    $( "#datepicker1" ).datepicker();
  });
  </script>
  
  </head>
  <body>
  <%Integer employee_id = new Integer(request.getParameter("empid")); %>
   <h3 align="center"
   style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;">
      HR Application
    </h3><h3 align="left"
             style="color:Navy; font-weight:bold; font-style:italic;">
      Insert Employee Request
    </h3>
    
    <form action="insertRequest_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
        
         <input type="hidden" name="employee_id"
                   value="<%=employee_id.intValue() %>" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Request Type:</td>
          <td width="50%">
            <select size="1" name="request_type" style="color:Navy; width:300px; height:25px; font-family:Arial;">
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
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">From Date:</td>
          <td width="50%">
           <input type="text" id="datepicker" name="From_Date"
                    style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">To Date:</td>
          <td width="50%">
             <input type="text" id="datepicker1" name="To_Date"
                    style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Note</td>
          <td width="50%">
            <input type="text" name="note" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr>
      </table>
       <input type="submit" value="Add Request" style="color:Navy; font-weight:bold;"/>
    </form>
  
  </body>
</html>