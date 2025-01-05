package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;

public class InventoryDao {
        public static void insertInventory(int productId, int number){
            try (Handle handle = JDBIConnector.me().open()){
                String query = "INSERT INTO inventory( product_id, quantity, last_update) VALUES ( ?, ?, NOW())";

                Update update = handle.createUpdate(query)
                        .bind(0, productId)
                        .bind(1, number);
                update.execute();
            }
        }

        public static int getNumberProduct(String productId){
            int result=0;
            try (Handle handle=JDBIConnector.me().open()){
                String query = "SELECT quantity FROM inventory WHERE product_id=?";
                result = handle.createQuery(query)
                        .bind(0,productId)
                        .mapTo(Integer.class)
                        .one();
            }
            return result;
        }

    public static String getStatuProduct(String id){
        String result="";
        try (Handle handle=JDBIConnector.me().open()){
            String query = "SELECT trangthai FROM kho WHERE masp=?";
            result = handle.createQuery(query)
                    .bind(0,id)
                    .mapTo(String.class)
                    .one();
        }
        return result;
    }

        public static void updateQuantilyProduct(String productId, int number, boolean bo){
            try (Handle handle = JDBIConnector.me().open()){
                String query ="UPDATE inventory SET quantity = ? WHERE product_id=?";
                int quantily=getNumberProduct(productId);
                if (bo){
                    quantily -= number;
                }else{
                    quantily += number;
                }

                Update update = handle.createUpdate(query)
                        .bind(0, quantily)
                        .bind(1, productId);
                update.execute();
            }catch (Exception e){

            }
        }

    public static void removeProduct(int productId){
        try (Handle handle = JDBIConnector.me().open()){
            String query = "DELETE FROM inventory WHERE product_id=?";
            Update update = handle.createUpdate(query)
                    .bind(0,productId);
            update.execute();

        }
    }

}
