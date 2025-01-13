package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.PreparedBatch;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.OderItems;

import java.util.ArrayList;
import java.util.List;

public class OderDetailDao {

        public static List<OderItems> getOder(int id){
        List<OderItems> oderDetails = new ArrayList<>();
        try (Handle handle = JDBIConnector.me().open()){
            String query ="SELECT order_id, product_id, quantity, price FROM order_items WHERE order_id=?";
            Query Ojb = handle.createQuery(query).bind(0, id);
            oderDetails = Ojb.map((rs,ctx)->
                    new OderItems(
                            rs.getInt("order_id"),
                            rs.getInt("product_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("price")
                    )
                    ).list();
        }catch (Exception e){
            return List.of();
        }
        return  oderDetails;
    }
    public static void insertBatch(List<OderItems> orderItems) {
        if (orderItems == null || orderItems.isEmpty()) {
            System.out.println("No items to insert.");
            return;
        }

        try (Handle handle = JDBIConnector.me().open()) {
            // Câu truy vấn chèn batch
            String query = "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

            PreparedBatch batch = handle.prepareBatch(query);
            for (OderItems item : orderItems) {
                batch.bind(0, item.getOrderId())
                        .bind(1, item.getProductId())
                        .bind(2, item.getQuantity())
                        .bind(3, item.getPrice())
                        .add();
            }

            int[] result = batch.execute();
            System.out.println("Batch insert successful! Rows affected: " + result.length);
        } catch (Exception e) {
            System.err.println("Error inserting batch data into order_items: " + e.getMessage());
            e.printStackTrace();
        }
    }


}
