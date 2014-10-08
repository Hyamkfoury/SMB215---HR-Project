package hr;
import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.Statement;
import java.sql.ResultSet;

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
        sqlString = "SELECT * FROM Employees ORDER BY employee_id"; 
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
        query = "SELECT * FROM Employees WHERE UPPER(first_name) like \'%" + name + "%\'" + 
        " OR UPPER(last_name) like \'%" + name + "%\'";
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
    }
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
   
    public String addEmployee(String first_name,
    String last_name, String email,
    String phone_number, String job_id, int salary) throws SQLException {
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
    salary + ",.30,100,80)";
    System.out.println("\nInserting: " + sqlString);
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

public boolean authenticateUser(String jdbcUrl, String userid, String password,
HttpSession session) throws SQLException {
this.jdbcUrl = jdbcUrl;
this.userid = userid;
this.password = password;
try {
OracleDataSource ds;
ds = new OracleDataSource();
 ds.setURL(jdbcUrl);
conn = ds.getConnection(userid, password);
return true;
} catch ( SQLException ex ) {
System.out.println("Invalid user credentials");
session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");
this.jdbcUrl = null;
this.userid = null;
this.password = null;
return false;
}
}
}

