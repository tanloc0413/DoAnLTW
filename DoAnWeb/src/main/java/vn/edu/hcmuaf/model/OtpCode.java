package vn.edu.hcmuaf.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class OtpCode {
    private String email;
    private int code;
    private LocalDateTime expiryDate;
    private LocalDateTime createDate;
    private int status;

    public OtpCode() {
    }

    public OtpCode( String email, int code, LocalDateTime expiryDate, LocalDateTime createDate, int status) {
        this.email = email;
        this.code = code;
        this.expiryDate = expiryDate;
        this.createDate = createDate;
        this.status = status;
    }


    public String getEmail() {return email;}

    public void setEmail(String email) {this.email = email;}

    public int getCode() {return code;}

    public void setCode(int code) {this.code = code;}

    public LocalDateTime getExpiryDate() {return expiryDate;}

    public void setExpiryDate(LocalDateTime expiryDate) {this.expiryDate = expiryDate;}

    public LocalDateTime getCreateDate() {return createDate;}

    public void setCreateDate(LocalDateTime createDate) {this.createDate = createDate;}

    public int getStatus() {return status;}

    public void setStatus(int status) {this.status = status;}

    @Override
    public String toString() {
        return "OtpCode{" +
                "email='" + email + '\'' +
                ", code=" + code +
                ", expiryDate=" + expiryDate +
                ", createDate=" + createDate +
                ", status=" + status +
                '}';
    }
}
