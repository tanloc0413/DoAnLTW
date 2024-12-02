package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.Categories;

import java.util.ArrayList;
import java.util.List;

public class CategoriesDao {

    public static List<Categories> getDirectorysAdmin() {
        List<Categories> productsList= new ArrayList<Categories>();
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT categories.id, categories.name, categories.`create`, status.status_name  FROM categories JOIN status on categories.status = status.id";

            Query queryObj = handle.createQuery(query);
            productsList = queryObj.map((rs, ctx) ->
                    new Categories(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getTimestamp("create"),
                            rs.getString("status_name")
                    )
            ).list();
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return productsList;
    }


    public static String getName(String id) {
        String name ="";
        try (Handle handle = JDBIConnector.me().open()) {
            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
            String query = "SELECT name FROM categories WHERE id=?";

            name = handle.createQuery(query).bind(0, id)
                    .mapTo(String.class)
                    .one();
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return "";
        }
        return name;
    }

//    public static String getID(String name) {
//        String result ="";
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT madanhmuc FROM danhmuc WHERE tendanhmuc=?";
//
//            result = handle.createQuery(query).bind(0, name)
//                    .mapTo(String.class)
//                    .one();
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Nếu có lỗi, trả về một danh sách trống
//            return "";
//        }
//        return result;
//    }

    public static void insertCategoryNew(String id, String ten, String status){
        try (Handle handle = JDBIConnector.me().open()){
            String query ="INSERT INTO categories(id, name, `create`, status) VALUES (?, ?, NOW(),?)";
            Update update = handle.createUpdate(query)
                    .bind(0, id)
                    .bind(1, ten)
                    .bind(2, status);
            update.execute();
        }
    }

    public static void removeCategory(String name){
        try (Handle handle = JDBIConnector.me().open()){
            String query = "DELETE FROM categories WHERE name=?";
            Update update = handle.createUpdate(query)
                    .bind(0, name);
            update.execute();
        }
    }
}
