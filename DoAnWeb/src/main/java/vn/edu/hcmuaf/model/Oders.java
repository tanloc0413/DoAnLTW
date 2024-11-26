package vn.edu.hcmuaf.model;

import java.util.Date;
import java.util.Random;

public class Oders {
  private int id;
  private int userId;
  private double totalPrice;
  private String status;
  private Date orderDate;

    public Oders() {
    }

    public Oders(int id, int userId, double totalPrice, String status, Date orderDate) {
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.status = status;
        this.orderDate = orderDate;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public int getUserId() {return userId;}

    public void setUserId(int userId) {this.userId = userId;}

    public double getTotalPrice() {return totalPrice;}

    public void setTotalPrice(double totalPrice) {this.totalPrice = totalPrice;}

    public String getStatus() {return status;}

    public void setStatus(String status) {this.status = status;}

    public Date getOrderDate() {return orderDate;}

    public void setOrderDate(Date orderDate) {this.orderDate = orderDate;}

    @Override
    public String toString() {
        return "Oders{" +
                "id=" + id +
                ", userId=" + userId +
                ", totalPrice=" + totalPrice +
                ", status='" + status + '\'' +
                ", orderDate=" + orderDate +
                '}';
    }
}
