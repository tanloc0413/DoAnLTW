package vn.edu.hcmuaf.model;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String address;
    private String email;
    private String phone;
    private String password;
    private int roler;
    private Date date;
    private String status;

    public User() {
    }

    public User(int id, String name, String address, String email, String phone, String password, int roler, Date date, String status) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.roler = roler;
        this.date = date;
        this.status = status;
    }

    public User(int id, String name, String address, String email, String phone,  String password, int roler, Date date) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.roler = roler;
        this.date = date;
    }

    public User(int id, String name, String address, String email, String phone,  String password, int roler) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;

        this.password = password;
        this.roler = roler;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getLevel() {
        return roler;
    }

    public void setLevel(int level) {
        this.roler = roler;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getRoler() {
        return roler;
    }

    public void setRoler(int roler) {
        this.roler = roler;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", roler=" + roler +
                ", date=" + date +
                ", status='" + status + '\'' +
                '}';
    }
}
