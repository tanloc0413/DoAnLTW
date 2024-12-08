package vn.edu.hcmuaf.model;

public class ProductCategory {
    private int id;
    private int category;
    private int product;

    public ProductCategory() {}

    public ProductCategory(int id, int category, int product) {
        this.id = id;
        this.category = category;
        this.product = product;
    }


    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public int getCategory() {return category;}

    public void setCategory(int category) {this.category = category;}

    public int getProduct() {return product;}

    public void setProduct(int product) {this.product = product;}

    @Override
    public String toString() {
        return "ProductCategory{" +
                "id=" + id +
                ", category=" + category +
                ", product=" + product +
                '}';
    }
}
