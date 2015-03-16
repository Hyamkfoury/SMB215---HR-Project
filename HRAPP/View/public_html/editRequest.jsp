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
    <jsp:useBean id="req" class="hr.Request" scope="page" >
<%Integer req_id = new Integer(request.getParameter("reqid"));
req = empsbean.findRequestById(req_id.intValue());%>
    </jsp:useBean>
    <form action="UpdateRequest_Action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
         
         
          <input type="hidden" name="employee_id"
                   value="<%=req.getEmployeeId() %>"/>
                   
           <input type="hidden" name="request_id"
                   value="<%=req.getRequestId() %>"/>
                 
                   </tr><tr>
           
        
        </tr><tr>
          <td width="50%">Type</td>
          <td width="50%">
            <input type="text" name="type" value="<%= req.getType() %>"/>
          </td>
        </tr><tr>
          <td width="50%">From Date</td>
          <td width="50%">
            <input type="text" name="From_Date"
                   value="<%= req.getFromDate() %>"/>
          </td>
        </tr><tr>
          <td width="50%">To Date</td>
          <td width="50%">
            <input type="text" name="To_Date"
                   value="<%= req.getToDate() %>"/>
          </td>
        </tr><tr>
          <td width="50%">Note</td>
          <td width="50%">
            <input type="text" name="note"
                   value="<%= req.getNote() %>"/>
          </td>
          
          
          </tr><tr>
          <td width="50%">Status</td>
          <td width="50%">
            <input type="text" name="status"
                   value="<%= req.getStatus() %>"/>
          </td>
          
        </tr>
      </table>
      <input type="submit" value="Update Request"/>
    
  </form></body>
</html>