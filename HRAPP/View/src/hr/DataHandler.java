package hr;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.sql.Date;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.Statement;
import java.sql.ResultSet;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

public class DataHandler {
    public DataHandler() {
    
    }
    
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String userid = "hr";
    String password = "hr";
    
        Connection conn;
        Statement stmt;
        ResultSet rset;
        String query;
        String sqlString;
        
    public void getDBConnection() throws SQLException {
     OracleDataSource ds;
     ds = new OracleDataSource();
     ds.setURL(jdbcUrl);
     conn=ds.getConnection(userid, password);
    }
    public ResultSet getAllEmployees() throws SQLException {
        try{
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        sqlString = "SELECT * FROM Employees, JOBS where employees.job_id = jobs.job_id ORDER BY employee_id"; 
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(sqlString);
            }
        catch(SQLException e){
        e.printStackTrace();
    }
        return rset;   
    }
    
    public ResultSet getAllEmployeesByName(String name) throws SQLException {
        try{
        name = name.toUpperCase();
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT * FROM Employees, JOBS WHERE employees.job_id = jobs.job_id and UPPER(first_name) like \'%" + name + "%\'" + 
        " OR UPPER(last_name) like \'%" + name + "%\'";
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
    
    public ResultSet getAllJobId() throws SQLException {
        try{
        
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT Job_Id, Job_Title  FROM Jobs";  
        
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
    
    public ResultSet getAllEmployeeRequests() throws SQLException {
        try{
        
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT REQ_ID, FIRST_NAME, LAST_NAME, FROMDATE, TODATE, TYPE, STATUS, NOTE  FROM EMPLOYEES, Requests WHERE EMPID = EMPLOYEE_ID";  
        
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
    
    public ResultSet getAllHistoryByEmployeeID(int empid) throws SQLException {
        try{
        
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT  DEPARTMENT_NAME, JOB_TITLE, START_DATE, END_DATE  FROM DEPARTMENTS, JOB_HISTORY, JOBS WHERE JOB_HISTORY.JOB_ID = JOBS.JOB_ID AND DEPARTMENTS.DEPARTMENT_ID = JOB_HISTORY.DEPARTMENT_ID and EMPLOYEE_ID = " + empid + " order by job_history.start_date";  
        
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
    
    public ResultSet getLeaveBalanceByEmployeeID(int empid) throws SQLException {
        try{
        
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT nvl(sum(trunc(todate) - trunc(fromdate)),0) as balance  FROM Requests WHERE EMPID = " + empid + " and type = 'LV_Ann' and status = 'Approved' group by empid";  
        
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
   
    public ResultSet getAllRequestsByEmployeeID(int empid) throws SQLException {
        try{
        
        getDBConnection();
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        query = "SELECT REQ_ID, FIRST_NAME, LAST_NAME, FROMDATE, TODATE, TYPE, STATUS, NOTE, MANAGER_ID  FROM EMPLOYEES, Requests WHERE EMPID = EMPLOYEE_ID and EMPLOYEE_ID = " + empid;  
        
        System.out.println("\nExecuting query:" + query);
        rset = stmt.executeQuery(query);
    }
        catch (SQLException e){
        e.printStackTrace();
    }
    return rset;   
    }
    public Employee findEmployeeById(int id) throws SQLException {
    try{
    Employee selectedEmp = new Employee();
    getDBConnection();
    stmt =
    conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    query = "SELECT * FROM Employees WHERE employee_id = " + id;
    System.out.println("\nExecuting: " + query);
    rset = stmt.executeQuery(query);
    while (rset.next()) {
    selectedEmp.setEmployeeId(new Integer(rset.getInt("employee_id")));
    selectedEmp.setFirstName(rset.getString("first_name"));
    selectedEmp.setLastName(rset.getString("last_name"));
    selectedEmp.setEmail(rset.getString("email"));
    selectedEmp.setPhoneNumber(rset.getString("phone_number"));
    selectedEmp.setHireDate(rset.getDate("hire_date"));
    selectedEmp.setSalary(new Double(rset.getDouble("salary")));
    selectedEmp.setJobId(rset.getString("job_id"));
    selectedEmp.setCommissionPct(new Double(rset.getDouble("commission_Pct"))); 
    selectedEmp.setDepartmentId(new Integer(rset.getInt("department_id")));   
    }
    return selectedEmp;
    }
    catch (SQLException e){
        e.printStackTrace();
        return null;
    }
 
    }
    
    public Request findRequestById(int reqid) throws SQLException {
    try{
    Request selectedReq = new Request();
    getDBConnection();
    stmt =
    conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    query = "SELECT to_char(fromdate,'mm/dd/yyyy') as from_date, to_char(todate,'mm/dd/yyyy') as to_date, note, status, type, empid, req_id FROM Requests WHERE  REQ_ID = " + reqid ;
    System.out.println("\nExecuting: " + query);
    rset = stmt.executeQuery(query);
    while (rset.next()) {
    selectedReq.setRequestId(new Integer(rset.getInt("req_id")));    
    selectedReq.setEmployeeId(new Integer(rset.getInt("empid")));
    selectedReq.setFromDate(rset.getString("from_date"));
    selectedReq.setToDate(rset.getString("to_date"));
    selectedReq.setStatus(rset.getString("status"));
    selectedReq.setNote(rset.getString("note")); 
    selectedReq.setType(rset.getString("type"));}
    return selectedReq;
    }
    catch (SQLException e){
        e.printStackTrace();
        return null;
    }
    
    }

    
public String  updateRequest(int employee_id,int request_id,String type,String from_date ,String to_date ,String note,String status )throws SQLException {
    try{
    
    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
   
    sqlString =
    "UPDATE Requests SET empid=" + employee_id +
    ", fromdate=to_date('" + from_date + "','mm/dd/yyyy'), todate=to_date('" + to_date + "','mm/dd/yyyy'), note='" + note + "', status = '" + status + "', type = '" + type +
    "' WHERE req_id = " + request_id;
    System.out.println("\nExecuting: " + sqlString);
    stmt.execute(sqlString); 
    
    return "success";
    }
    catch (SQLException e){
        e.printStackTrace();
    }

    return "fail";
    }
   


    public String updateEmployee(int employee_id, String first_name,
    String last_name, String email,
    String phone_number, String salary,
    String job_id) throws SQLException {
    try{
    Employee oldEmployee = findEmployeeById(employee_id);
    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    StringBuffer columns = new StringBuffer( 255 );
    if ( first_name != null &&
    !first_name.equals( oldEmployee.getFirstName() ) )
    {
    columns.append( "first_name = '" + first_name + "'" );
    }
    if ( last_name != null &&
    !last_name.equals( oldEmployee.getLastName() ) ) {
    if ( columns.length() > 0 ) {
    columns.append( ", " );
    }
    columns.append( "last_name = '" + last_name + "'" );
    }
    if ( email != null &&
    !email.equals( oldEmployee.getEmail() ) ) {
    if ( columns.length() > 0 ) {
    columns.append( ", " );
    }
    columns.append( "email = '" + email + "'" );
    }
    if ( phone_number != null &&
    !phone_number.equals( oldEmployee.getPhoneNumber() ) ) {
    if ( columns.length() > 0 ) {
    columns.append( ", " );
    }
    columns.append( "phone_number = '" + phone_number + "'" );
    }
    if ( salary != null &&
    !salary.equals( oldEmployee.getSalary().toString() ) ) {
    if ( columns.length() > 0 ) {
    columns.append( ", " );
    }
    columns.append( "salary = '" + salary + "'" );
    }
    if ( job_id != null &&
    !job_id.equals( oldEmployee.getJobId() ) ) {
    if ( columns.length() > 0 ) {
    columns.append( ", " );
    }
    columns.append( "job_id = '" + job_id + "'" );
    
    //do insert the current job to job_history
    
    /*Date end_date = null;
    
    sqlString = "select max(end_date) as end from Job_history where employee_id = " + employee_id;
    rset = stmt.executeQuery(sqlString);
        while (rset.next()) 
            end_date = (rset.getDate("end")!= null)? rset.getDate("end") : oldEmployee.getHireDate();  
    sqlString = "insert into job_history (employee_id,start_date,end_date, job_id, department_id) values (" + employee_id + ",to_date('" + end_date + "','YYYY-MM-DD'), sysdate,'" + oldEmployee.getJobId() + "'," + oldEmployee.getDepartmentId() + ")";
        stmt.execute(sqlString);
    */}
    if ( columns.length() > 0 )
    {
      
    sqlString =
    "UPDATE Employees SET " + columns.toString() +
    " WHERE employee_id = " + employee_id;
    System.out.println("\nExecuting: " + sqlString);
    stmt.execute(sqlString);
    }
    else
    {
    System.out.println( "Nothing to do to update Employee Id: " +
    employee_id);
    }
    return "success";
    }
    catch (SQLException e){
        e.printStackTrace();
    }
    return "fail";
    }
   
   public String addRequest(String type,int employee_id, String from_date,String to_date,String note, String status)
   throws SQLException {
    try{
    getDBConnection();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    sqlString = "INSERT INTO Requests columns(FROMDATE, TODATE, NOTE, STATUS, TYPE, EMPID, REQ_ID) VALUES(to_date( '" +
    from_date + "','mm/dd/yyyy'),to_date('" +
    to_date + "','mm/dd/yyyy'),'" +
    note + "','" +
    status + "','" +
    type + "','" +
    employee_id + "'," +
    "REQ_SEQ.nextval)";
    System.out.println("\nInserting: " + sqlString);
    stmt.execute(sqlString);
        return "success";
}
    catch (SQLException e){
        e.printStackTrace();
    }
   
        return "fail";
    }
   
    public String addEmployee(String first_name,
    String last_name, String email,
    String phone_number, String job_id, int salary, String password) throws SQLException {
    try{
    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    sqlString = "INSERT INTO Employees VALUES (EMPLOYEES_SEQ.nextval, '" +
    first_name + "','" +
    last_name + "','" +
    email + "','" +
    phone_number + "'," +
    "SYSDATE, '" +
    job_id + "', " +
    salary + ",.30,100,80,'" + password + "')";
    System.out.println("\nInserting: " + sqlString);
    stmt.execute(sqlString);
        return "success";
}
    catch (SQLException e){
        e.printStackTrace();
    }
        return "fail";
    }
    
    public String deleteRequestById(int id) throws SQLException {
    try {
    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    sqlString = "DELETE FROM Requests WHERE req_id = " + id;
    System.out.println("\nExecuting: " + sqlString);
    stmt.execute(sqlString);
    return "success";
    }      
        catch (SQLException e){
            e.printStackTrace();
        }
    return "fail";
}
   
    public String deleteEmployeeById(int id) throws SQLException {
    try {
    getDBConnection();
    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    ResultSet.CONCUR_READ_ONLY);
    sqlString = "DELETE FROM Employees WHERE employee_id = " + id;
    System.out.println("\nExecuting: " + sqlString);
    stmt.execute(sqlString);
    return "success";
    }      
        catch (SQLException e){
            e.printStackTrace();
        }
    return "fail";
}

public boolean authenticateUser(String userid, String password,
HttpSession session) throws SQLException {
    try{
getDBConnection();


    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
    query = "SELECT  nvl(MANAGER_ID,0) FROM EMPLOYEES WHERE EMPLOYEE_ID = " + userid + " and password = " + password;  
    
    System.out.println("\nExecuting query:" + query);
    rset = stmt.executeQuery(query);
        if (rset.next()){
        session.setAttribute("userid", userid);
        session.setAttribute("manager",rset.getInt(1));
               return true;
        }
        else{
            
            session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");
            return false;
        }
            
} catch ( SQLException ex ) {
System.out.println("Invalid user credentials");
session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");

return false;
}
}
}

