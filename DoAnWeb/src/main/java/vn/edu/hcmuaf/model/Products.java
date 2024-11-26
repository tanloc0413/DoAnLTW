package vn.edu.hcmuaf.model;

import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

public class Products {

    private int id;
    private String name;
    private String brand;
    private double price;
    private String description;
    private Date create;

    public Products() {
    }

    public Products(int id, String name, String brand, double price, String description, Date create) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.description = description;
        this.create = create;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public String getBrand() {return brand;}

    public void setBrand(String brand) {this.brand = brand;}

    public double getPrice() {return price;}

    public void setPrice(double price) {this.price = price;}

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

    public Date getCreate() {return create;}

    public void setCreate(Date create) {this.create = create;}

    @Override
    public String toString() {
        return "Products{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", create=" + create +
                '}';
    }
}
