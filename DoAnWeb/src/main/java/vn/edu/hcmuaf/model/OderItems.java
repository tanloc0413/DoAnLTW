package vn.edu.hcmuaf.model;

public class OderItems {
   private int id;
   private int orderId;
   private int productId;
   private int quantity;
   private double price;

    public OderItems() {
    }

    public OderItems(int id, int orderId, int productId, int quantity, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    public double getPrice() {return price;}

    public void setPrice(double price) {this.price = price;}

    public int getQuantity() {return quantity;}

    public void setQuantity(int quantity) {this.quantity = quantity;}

    public int getProductId() {return productId;}

    public void setProductId(int productId) {this.productId = productId;}

    public int getOrderId() {return orderId;}

    public void setOrderId(int orderId) {this.orderId = orderId;}

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    @Override
    public String toString() {
        return "OderItems{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
}
