<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>insert</title>
  </head>
  <body>
    <h3 align="center">
      HR Application
    </h3><h3>
      Insert Employee Record
    </h3><form action="insert_action.jsp">
      <table cellspacing="2" cellpadding="3" border="1" width="100%">
        <tr>
          <td width="50%">First Name</td>
          <td width="50%">
            <input type="text" name="first_name"/>
          </td>
        </tr><tr>
          <td width="50%">Last Name</td>
          <td width="50%">
            <input type="text" name="last_name"/>
          </td>
        </tr><tr>
          <td width="50%">Email</td>
          <td width="50%">
            <input type="text" name="email"/>
          </td>
        </tr><tr>
          <td width="50%">Phone</td>
          <td width="50%">
            <input type="text" name="phone_number"/>
          </td>
        </tr><tr>
          <td width="50%">Job</td>
          <td width="50%">
            <select size="1" name="job_id">
              <option value="SA_REP">
                Sales Representative
              </option>
              <option value="PR_REP">
                PR Representative
              </option>
              <option value="MK_MAN">
                Marketing Manager
              </option>
              <option value="SA_MAN">
                Sales Manager
              </option>
              <option value="FI_MAN">
                Finance Manager
              </option>
              <option value="IT_PROG">
                Software Developer
              </option>
              <option value="AD_VIP">
                Vice President
              </option>
            </select>
          </td>
        </tr><tr>
          <td width="50%">Monthly Salary</td>
          <td width="50%">
            <input type="text" name="salary"/>
          </td>
        </tr>
      </table>
       <input type="submit" value="Add Employee"/>
    </form>
  </body>
</html>