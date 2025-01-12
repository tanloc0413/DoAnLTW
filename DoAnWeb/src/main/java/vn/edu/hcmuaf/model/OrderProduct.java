package vn.edu.hcmuaf.model;

public class OrderProduct {
    private Products product;
    private int quantity;

    public OrderProduct(Products product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
