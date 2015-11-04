package hr;
import java.sql.Date;
public class Request {
    public Request(){
        
    }
    
    private Integer requestId;
    private Integer employeeId;
    private String type;
    private String fromDate;
    private String toDate;
    private String Note;
    private String Status;
    
    public void setEmployeeId(Integer employeeId) {
    this.employeeId = employeeId;
    }
    public Integer getEmployeeId() {
    return employeeId;
    }
    
    public void setRequestId(Integer RequestId) {
    this.requestId = RequestId;
    }
    public Integer getRequestId() {
    return requestId;
    }
    
    public void setType(String type) {
    this.type = type;
    }
    public String getType() {
    return type;
    }
    
    public void setFromDate(String fromDate) {
    this.fromDate = fromDate;
    }
    public String getFromDate() {
    return fromDate;
    }

    public void setToDate(String toDate) {
    this.toDate = toDate;
    }
    public String getToDate() {
    return toDate;
    }
    
    public void setNote(String note) {
    this.Note = note;
    }
    public String getNote() {
    return Note;
    }
    
    public void setStatus(String status) {
    this.Status = status;
    }
    public String getStatus() {
    return Status;
    }
}
