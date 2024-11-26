package vn.edu.hcmuaf.model;

import java.util.Date;

public class Categories {
    private int id;
    private String name;
    private Date created;

    public Categories() {
    }

    public Categories(int id, String name, Date created) {
        this.id = id;
        this.name = name;
        this.created = created;
    }

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public Date getCreated() {return created;}
    public void setCreated(Date created) {this.created = created;}

    @Override
    public String toString() {
        return "Categories{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", created=" + created +
                '}';
    }
}
