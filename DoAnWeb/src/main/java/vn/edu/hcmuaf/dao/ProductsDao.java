package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;

import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.Products;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ProductsDao {

    /*
    lấy danh sách tất cả sản phẩm
     */
    public static List<Products> getProductAdmin() {
        List<Products> productsList= new ArrayList<Products>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT  product.product_id, product.product_name, product.brand, product.price, product.description, product.create,  status.`status_name`, product.image FROM product JOIN status  ON product.status = status.id ";

            Query queryObj = handle.createQuery(query);
            productsList = queryObj.map((rs, ctx) ->
                    new Products(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getTimestamp("create"),
                            rs.getString("status_name"),
                            rs.getString("image")
                    )
                    ).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }

    public static List<Products> getNewProduct() {
        List<Products> productsList= new ArrayList<Products>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT  product.product_id, product.product_name, product.brand, product.price, product.description, product.create,  status.`status_name`, product.image FROM product JOIN status  ON product.status = status.id LIMIT 5";

            Query queryObj = handle.createQuery(query);
            productsList = queryObj.map((rs, ctx) ->
                    new Products(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getTimestamp("create"),
                            rs.getString("status_name"),
                            rs.getString("image")
                    )
            ).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }

//    public static List<Products> getProducts() {
//        List<Products> productsList= new ArrayList<Products>();
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT  product_id, product_name, price, giaban,phienban FROM product  ";
//
//            Query queryObj = handle.createQuery(query);
//            productsList = queryObj.map((rs, ctx) ->
//                    new Products(
//                            rs.getString("hinhanh"),
//                            rs.getString("masp"),
//                            rs.getString("tenSP"),
//                            rs.getLong("giaban"),
//                            rs.getString("phienban")
//                    )
//            ).list();
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Nếu có lỗi, trả về một danh sách trống
//            return List.of();
//        }
//        return productsList;
//    }
    /*
    lấy sản phẩm theo danh mục
     */
    public static List<Products> getProductByDiretory(int diretory) {
        List<Products> productsList= new ArrayList<Products>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT  product.product_id, product.product_name, product.brand, product.price, product.description, product.create,  status.`status_name`, product.image FROM product JOIN status  ON product.status = status.id  where product.product_id IN (SELECT product_id from product_categories where categories_id = ?)";

            Query queryObj = handle.createQuery(query)
                    .bind(0, diretory);
            productsList = queryObj.map((rs, ctx) ->
                    new Products(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getTimestamp("create"),
                            rs.getString("status_name"),
                            rs.getString("image")
                    )
            ).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }

    public static List<Products> getProductSearch(String search) {
        List<Products> productsList = new ArrayList<>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Sử dụng từ khóa LIKE với CONCAT để tìm kiếm
            String query = "SELECT product.product_id, product.product_name, product.brand, product.price, " +
                    "product.description, product.create, status.status_name, product.image " +
                    "FROM product " +
                    "JOIN status ON product.status = status.id " +
                    "WHERE product.product_name LIKE CONCAT('%', :search, '%')";

            productsList = handle.createQuery(query)
                    .bind("search", search) // Truyền giá trị tìm kiếm
                    .map((rs, ctx) ->
                            new Products(
                                    rs.getInt("product_id"),
                                    rs.getString("product_name"),
                                    rs.getString("brand"),
                                    rs.getDouble("price"),
                                    rs.getString("description"),
                                    rs.getTimestamp("create"),
                                    rs.getString("status_name"),
                                    rs.getString("image")
                            )
                    ).list();

        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }





    ///*
//loc danh sach san pham theo danh muc : 5 san pham
// */
//
public static List<Products> getProductByNumDiretory(int diretory) {
    List<Products> productsList= new ArrayList<Products>();
    try (Handle handle = JDBIConnector.me().open()) {
        // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
        String query = "SELECT  product.product_id, product.product_name, product.brand, product.price, product.description, product.create,  status.`status_name`, product.image FROM product JOIN status  ON product.status = status.id  where product.product_id IN (SELECT product_id from product_categories where categories_id = ?)";

        Query queryObj = handle.createQuery(query)
                .bind(0, diretory);
        productsList = queryObj.map((rs, ctx) ->
                new Products(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("brand"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getTimestamp("create"),
                        rs.getString("status_name"),
                        rs.getString("image")
                )
        ).list();


    } catch (Exception e) {
        e.printStackTrace();
        // Nếu có lỗi, trả về một danh sách trống
        return List.of();
    }
    return productsList;
}



//
//    /*
//    tổng số sản phẩm thuộc 1 danh mục
//     */
//    public static int numberProductByDirectory(String id) {
//        int number =0;
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT COUNT(masp) FROM sanpham WHERE danhmuc=?";
//
//            number = handle.createQuery(query).bind(0, id)
//                    .mapTo(Integer.class)
//                    .one();
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Nếu có lỗi, trả về một danh sách trống
//            return 0;
//        }
//        return number;
//    }
//
    /*
    lấy thông tin 1 sản phẩm
     */
    public static Products getProduct(int id){
        Products product;
        try (Handle handle = JDBIConnector.me().open()){
            String query = "SELECT product_id, product_name, brand, price, description, `create`, status, image FROM product WHERE product_id = ?";
            Query queryObj = handle.createQuery(query)
                    .bind(0, id);

            product = (Products) queryObj.map((rs, ctx)->
                    new Products(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("brand"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getTimestamp("create"),
                            rs.getString("status"),
                            rs.getString("image")
                    )).findOne().orElse(null);
        }

        return product;
    }

    public static void insertProductNew(int product_id, String product_name, String brand, double price, String description,String status, String image){

        try (Handle handle = JDBIConnector.me().open()){
            String query = "INSERT INTO product(product_id, product_name, brand, price, description, `create`, status, image) VALUES (?,?,?,?,?,NOW(),?,?)";
            Update update = handle.createUpdate(query)
                    .bind(0, product_id)
                    .bind(1, product_name)
                    .bind(2, brand)
                    .bind(3, price)
                    .bind(4, description)
                    .bind(5, status)
                    .bind(6, image);
            update.execute();
        }
    }

    public static void updateProduct(String id, String danhmuc, String ten, String type, String mota, double price, String version, String hang, String hangdung, String baohanh, int number, String status){
        try (Handle handle=JDBIConnector.me().open()){
            String query="UPDATE sanpham SET  danhmuc=?, tensp=?, loaisp=?, mota=?, giaban=?, phienban=?, hangsx=?, hangdung=?, baohanh=?, soluongthietbi=?, trangthai=? WHERE masp=?";
            Update update = handle.createUpdate(query)
                    .bind(0, danhmuc)
                    .bind(1, ten)
                    .bind(2, type)
                    .bind(3, mota)
                    .bind(4, price)
                    .bind(5, version)
                    .bind(6, hang)
                    .bind(7, hangdung)
                    .bind(8, baohanh)
                    .bind(9, number)
                    .bind(10, status)
                    .bind(11, id);
            update.execute();
        }
    }

    public static void removeProduct(int id){
        try (Handle handle = JDBIConnector.me().open()){
            String query = "DELETE FROM product WHERE product_id=?";
            Update update = handle.createUpdate(query)
                    .bind(0,id);
            update.execute();

        }
    }

    /*
    lấy giá bán của 1 sản phẩm
     */
    public static int getPriceProduct(String id){
        int result=0;
        try (Handle handle = JDBIConnector.me().open()){
            String query ="SELECT giaban FROM sanpham WHERE masp=?";
            result = handle.createQuery(query).bind(0, id)
                    .mapTo(Integer.class)
                    .one();
        }
        return result;
    }
//    public static void main(String[] args) {
//        List<Products> list = getProductByDiretory("20237001");
//
//            for (Products i: list){
//                System.out.println(i.toString());
//            }
//        System.out.println(list.size());
//
//    }
}
