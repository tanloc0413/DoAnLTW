package vn.edu.hcmuaf.model;

import java.util.Date;

public class Categories {
    private int id;
    private String name;
    private Date created;
    private String status;

    public Categories() {
    }

    public Categories(int id, String name, Date created, String status) {
        this.id = id;
        this.name = name;
        this.created = created;
        this.status = status;
    }

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public Date getCreated() {return created;}
    public void setCreated(Date created) {this.created = created;}
    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}

    @Override
    public String toString() {
        return "Categories{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", created=" + created +
                ", status='" + status + '\'' +
                '}';
    }
}
