<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
 
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>edit</title>
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
    <h2 align="center" 
    style="color:Navy; font-family:Andalus; font-size:xx-large; font-weight:bold; background-color:ActiveCaption; background-repeat:repeat-x; font-style:italic; vertical-align:top;">
      HR Application
    </h2><h3 align="left"
             style="color:Navy; font-weight:bold; font-style:italic;">
       <a href="Requests.jsp"> Edit Request </a>
    </h3>
    <jsp:useBean id="empsbean" class="hr.DataHandler" scope="session"/>
    <jsp:useBean id="req" class="hr.Request" scope="page" >
<%Integer req_id = new Integer(request.getParameter("reqid"));
req = empsbean.findRequestById(req_id.intValue());%>
    </jsp:useBean>
    <form action="UpdateRequest_Action.jsp" style="color:Navy;">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
         
         
          <input type="hidden" name="employee_id"  style="color:Navy; width:300px; height:25px; font-family:Arial;"
                   value="<%=req.getEmployeeId() %>" />
                   
           <input type="hidden" name="request_id"
                   value="<%=req.getRequestId() %>"/>
                 
                   </tr>
                   <tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Type</td>
          <td width="50%">
          <select size="1" name="type" style="color:Navy; width:306px; height:25px; font-family:Arial;"/>
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
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">From Date</td>
          <td width="50%">
          
            <input type="text" id="datepicker" name="From_Date"
                   value="<%= req.getFromDate() %>" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
           
          
          </td>
        </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">To Date</td>
          <td width="50%">
            <input type="text" id="datepicker1" name="To_Date"
                   value="<%= req.getToDate() %>" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
        </tr><tr>
          <td width="50%"style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Note</td>
          <td width="50%">
            <input type="text" name="note"
                   value="<%= req.getNote() %>" style="color:Navy; width:300px; height:25px; font-family:Arial;"/>
          </td>
          
          
          </tr><tr>
          <td width="50%" style="font-weight:bold; text-align:center; color:Navy; font-style:italic; background-color:InactiveCaption;">Status</td>
          <td width="50%">
           
             <select size="1" name="status" style="color:Navy; width:306px; height:25px; font-family:Arial;"/>
              <option value="Approved">
                Approved
              </option>
              <option value="Refused">
                Refused
              </option>
              <option value="Pending">
                Pending
              </option>
              <option value="New">
                New
              </option>
              
             </select> 
          </td>
          
        </tr>
      </table>
      <input type="submit" value="Update Request" style="color:Navy; font-weight:bold;"/>
    
  </form></body>
</html>