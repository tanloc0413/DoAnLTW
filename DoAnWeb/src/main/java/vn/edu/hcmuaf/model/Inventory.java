package vn.edu.hcmuaf.model;

import java.util.Date;

public class Inventory {
   private int id;
   private int productId;
   private int quantity;
   private Date lastUpdate;

   public Inventory() {}

    public Inventory(int id, int productId, int quantity, Date lastUpdate) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.lastUpdate = lastUpdate;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public int getProductId() {return productId;}

    public void setProductId(int productId) {this.productId = productId;}

    public int getQuantity() {return quantity;}

    public void setQuantity(int quantity) {this.quantity = quantity;}

    public Date getLastUpdate() {return lastUpdate;}

    public void setLastUpdate(Date lastUpdate) {this.lastUpdate = lastUpdate;}

    @Override
    public String toString() {
        return "Inventory{" +
                "id=" + id +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", lastUpdate=" + lastUpdate +
                '}';
    }
}
