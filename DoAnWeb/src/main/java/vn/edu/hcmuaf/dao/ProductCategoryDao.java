package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.ProductCategory;
import vn.edu.hcmuaf.model.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductCategoryDao {

    /*
  lấy danh sách tất cả sản phẩm
   */
    public static List<ProductCategory> getList() {
        List<ProductCategory> productsList= new ArrayList<ProductCategory>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT  id, categories_id, product_id FROM product_categories";

            Query queryObj = handle.createQuery(query);
            productsList = queryObj.map((rs, ctx) ->
                    new ProductCategory(
                            rs.getInt("id"),
                            rs.getInt("categories_id"),
                            rs.getInt("product_id")
                    )
            ).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }

    public static int getIDCategory(int id) {
        int idCa= 0;
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT  categories_id FROM product_categories WHERE product_id = ?";

            // Thực hiện truy vấn
            idCa = handle.createQuery(query)
                    .bind(0, id) // Gán tham số cho product_id
                    .mapTo(Integer.class) // Map kết quả vào kiểu Integer
                    .findOne() // Lấy giá trị đầu tiên nếu có
                    .orElse(0); // Nếu không tìm thấy, trả về 0
        } catch (Exception e) {
            e.printStackTrace();
        }
        return idCa;
    }



    public static boolean addProductCategory(int categoryId, int productID) {
        try (Handle handle = JDBIConnector.me().open()) {
            // SQL query to insert a new record into the product_categories table
            String query = "INSERT INTO product_categories ( categories_id, product_id) VALUES ( ?, ?)";

            // Execute the insert query with parameters
            int rowsAffected = handle.createUpdate(query)
                    .bind(0, categoryId)
                    .bind(1, productID)
                    .execute();

            // Return true if at least one row was affected
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int getNum(int id) {
        int num= 0;
        try (Handle handle = JDBIConnector.me().open()) {
            // SQL query để đếm số dòng
            String query = "SELECT COUNT(*) AS total_rows FROM product_categories WHERE categories_id=?";

            // Thực hiện truy vấn và lấy kết quả
            num = handle.createQuery(query)
                    .bind(0, id)
                    .mapTo(Integer.class)
                    .one();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }


    public static void removeForProduct(int id){
        try (Handle handle = JDBIConnector.me().open()){
            String query = "DELETE FROM product_categories WHERE product_id=?";
            Update update = handle.createUpdate(query)
                    .bind(0,id);
            update.execute();

        }
    }
}
