package hr;
import java.sql.Date;
public class Employee {
public Employee() {
}
private Integer employeeId;
private String firstName;
private String lastName;
private String email;
private String phoneNumber;
private Date hireDate;
private String jobId;
private Double salary;
private Double commissionPct;
private Integer departmentId;

public void setEmployeeId(Integer employeeId) {
this.employeeId = employeeId;
}
public Integer getEmployeeId() {
return employeeId;
}
public void setFirstName(String firstName) {
this.firstName = firstName;
}
public String getFirstName() {
return firstName;
}
public void setLastName(String lastName) {
this.lastName = lastName;
}
public String getLastName() {
return lastName;
}


public void setEmail(String email) {
this.email = email;
}
public String getEmail() {
return email;
}


public void setPhoneNumber(String phoneNumber) {
this.phoneNumber = phoneNumber;
}
public String getPhoneNumber() {
return phoneNumber;
}


public void setHireDate(Date hireDate) {
this.hireDate = hireDate;
}
public Date getHireDate() {
return hireDate;
}

public void setJobId(String jobId) {
this.jobId = jobId;
}
public String getJobId() {
return jobId;
}

public void setSalary(Double salary) {
this.salary = salary;
}
public Double getSalary() {
return salary;
}

public void setCommissionPct(Double commissionPct) {
this.commissionPct = commissionPct;
}
public Double CommissionPct() {
return commissionPct;
}

public void setDepartmentId(Integer departmentId) {
this.departmentId = departmentId;
}
public Integer getDepartmentId() {
return departmentId;
}
}
