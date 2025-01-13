package vn.edu.hcmuaf.dao;

import ch.qos.logback.core.encoder.EchoEncoder;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.Oders;
import vn.edu.hcmuaf.model.Products;

import java.util.ArrayList;
import java.util.List;

public class OdersDao {
    /*
    lấy danh sach các đơn đặt hàng
     */
    public static List<Oders> getOdersAdmin() {
        List<Oders> odersList = new ArrayList<>();

        try (Handle handle = JDBIConnector.me().open()) {
            // Truy vấn để lấy danh sách đơn hàng
            String query = "SELECT order_id, user_id, total_price, status, `create` FROM `order`";

            odersList = handle.createQuery(query)
                    .map((rs, ctx) -> new Oders(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getDouble("total_price"),
                            rs.getString("status"),
                            rs.getTimestamp("create")
                    ))
                    .list();

            System.out.println("Query successful: " + odersList.size() + " orders fetched.");
        } catch (Exception e) {
            System.err.println("Error while fetching orders: " + e.getMessage());
            e.printStackTrace();
            // Trả về danh sách trống trong trường hợp có lỗi
            return List.of();
        }

        return odersList;
    }


    /*
   lấy danh sach các đơn đặt hàng
    */
    public static List<Oders> getOdersAdminStatus(String status) {
        List<Oders> odersList = new ArrayList<>();

        try (Handle handle = JDBIConnector.me().open()) {
            // Truy vấn để lấy danh sách đơn hàng
            String query = "SELECT order_id, user_id, total_price, status, `create` FROM `order` WHERE `status` = ?";

            odersList = handle.createQuery(query).bind(0, status)
                    .map((rs, ctx) -> new Oders(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getDouble("total_price"),
                            rs.getString("status"),
                            rs.getTimestamp("create")
                    ))
                    .list();

            System.out.println("Query successful: " + odersList.size() + " orders fetched.");
        } catch (Exception e) {
            System.err.println("Error while fetching orders: " + e.getMessage());
            e.printStackTrace();
            // Trả về danh sách trống trong trường hợp có lỗi
            return List.of();
        }

        return odersList;
    }


    public static Oders getOrderById(int orderId) {
        Oders order = null;

        try (Handle handle = JDBIConnector.me().open()) {
            // Truy vấn để lấy đơn hàng theo ID
            String query = "SELECT order_id, user_id, total_price, status, `create` FROM `order` WHERE order_id = ?";

            order = handle.createQuery(query)
                    .bind(0, orderId)
                    .map((rs, ctx) -> new Oders(
                            rs.getInt("order_id"),
                            rs.getInt("user_id"),
                            rs.getDouble("total_price"),
                            rs.getString("status"),
                            rs.getTimestamp("create")
                    ))
                    .findOne()
                    .orElse(null);

            if (order != null) {
                System.out.println("Order fetched successfully: " + orderId);
            } else {
                System.out.println("No order found with ID: " + orderId);
            }
        } catch (Exception e) {
            System.err.println("Error while fetching order with ID: " + orderId);
            e.printStackTrace();
        }

        return order;
    }


    /*
    lấy danh sách đơn hàng theo hình thức đơn hàng chưa hoàn thành
     */
//
//
//    public static List<String> getID() {
//        List<String> odersList= new ArrayList<String>();
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT madonhang FROM dondathang";
//            Query queryObj = handle.createQuery(query);
//            odersList = queryObj.mapTo(String.class).list();
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Nếu có lỗi, trả về một danh sách trống
//            return List.of();
//        }
//        return odersList;
//    }
    /*
   lấy danh sách đơn hàng theo hình thức đơn hàng chưa hoàn thành
    */
//

//    public static Oders getOders(String id) {
//        Oders oders= new Oders();
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT madonhang, makh, ngaytao, tongdh, ten, sdt, diachi, trangthai, thanhtoan FROM dondathang WHERE madonhang=?";
//
//            Query queryObj = handle.createQuery(query).bind(0,id);
//            oders = queryObj.map((rs, ctx) ->
//                    new Oders(
//                            rs.getString("madonhang"),
//                            rs.getString("makh"),
//                            rs.getTimestamp("ngaytao"),
//                            rs.getLong("tongdh"),
//                            rs.getString("ten"),
//                            rs.getString("sdt"),
//                            rs.getString("diachi"),
//                            rs.getString("trangthai"),
//                            rs.getString("thanhtoan")
//                    )
//            ).findOne().orElse(null);
//
//
//        } catch (Exception e) {
//
//        }
//        return oders;
//
//    }

//    public static List<Oders> getOdersbyKH(String id) {
//        List<Oders> oders = new ArrayList<>();
//        try (Handle handle = JDBIConnector.me().open()) {
//            // Thực hiện truy vấn để lấy dữ liệu ID từ bảng staging
//            String query = "SELECT madonhang, makh, ngaytao, tongdh, ten, sdt, diachi, trangthai, thanhtoan FROM dondathang WHERE makh=?";
//
//            Query queryObj = handle.createQuery(query).bind(0,id);
//            oders = queryObj.map((rs, ctx) ->
//                    new Oders(
//                            rs.getString("madonhang"),
//                            rs.getString("makh"),
//                            rs.getTimestamp("ngaytao"),
//                            rs.getLong("tongdh"),
//                            rs.getString("ten"),
//                            rs.getString("sdt"),
//                            rs.getString("diachi"),
//                            rs.getString("trangthai"),
//                            rs.getString("thanhtoan")
//                    )
//            ).list();
//
//
//        } catch (Exception e) {
//
//        }
//        return oders;
//
//    }


    public static void insertOders(int id, int userId, double totalPrice, String status) {
        try (Handle handle = JDBIConnector.me().open()) {
            // Câu truy vấn chèn dữ liệu
            String query = "INSERT INTO `order` (order_id, user_id, total_price, status, `create`) VALUES (?, ?, ?, ?, NOW())";

            // Thực hiện chèn dữ liệu
            handle.createUpdate(query)
                    .bind(0, id)
                    .bind(1, userId)
                    .bind(2, totalPrice)
                    .bind(3, status)
                    .execute();

            System.out.println("Insert successful: order_id = " + id);
        } catch (Exception e) {
            // Xử lý lỗi
            System.err.println("Error inserting order: " + e.getMessage());
            e.printStackTrace();
        }
    }


    public static void updateOder( String status, int id) {
        String query = "UPDATE `order` SET status = ? WHERE order_id = ?";

        try (Handle handle = JDBIConnector.me().open()) {
            int rowsAffected = handle.createUpdate(query)
                    .bind(0, status) // Bind status to the first parameter
                    .bind(1, id) // Bind id to the second parameter
                    .execute(); // Execute the update query

            if (rowsAffected > 0) {
                System.out.println("Order updated successfully. Rows affected: " + rowsAffected);
            } else {
                System.out.println("No order found with the given ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error updating the order with ID: " + id);
        }
    }


}
