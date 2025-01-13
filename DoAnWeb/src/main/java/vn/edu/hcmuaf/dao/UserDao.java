package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;

import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.User;

import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public static List<User> getUserByLevel(int level) {
        List<User> usersList = new ArrayList<>();
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "SELECT user_id, name, email, phone, address, pass, roler, `create`, status FROM user WHERE roler = ?";
            Query obj = handle.createQuery(query)
                    .bind(0, level);
            usersList = obj.map((rs, ctx) ->
                    new User(
                            rs.getInt("user_id"),         // ID người dùng (id)
                            rs.getString("name"),         // Tên (name)
                            rs.getString("address"),      // Địa chỉ (address)
                            rs.getString("email"),        // Email (email)
                            rs.getString("phone"),        // Số điện thoại (phone)
                            rs.getString("pass"),         // Mật khẩu (password)
                            rs.getInt("roler"),           // Vai trò (roler)
                            rs.getTimestamp("create"),    // Ngày tạo (date)
                            rs.getString("status")        // Trạng thái (status)
                    )).list();
        } catch (Exception e) {
            e.printStackTrace();
            // Trả về danh sách rỗng nếu có lỗi
            return List.of();
        }
        return usersList;
    }



    public static List<User> getUserByLevelAdmin() {
        List<User> usersList= new ArrayList<User>();
        try (Handle handle = JDBIConnector.me().open()) {
            String query ="SELECT user_id, name, email, phone, address, pass, roler, `create`, status FROM user WHERE roler!=2";
            Query Ojb = handle.createQuery(query);
            usersList = Ojb.map((rs,ctx)->
                    new User(
                            rs.getInt("user_id"),         // ID người dùng (id)
                            rs.getString("name"),         // Tên (name)
                            rs.getString("address"),      // Địa chỉ (address)
                            rs.getString("email"),        // Email (email)
                            rs.getString("phone"),        // Số điện thoại (phone)
                            rs.getString("pass"),         // Mật khẩu (password)
                            rs.getInt("roler"),           // Vai trò (roler)
                            rs.getTimestamp("create"),    // Ngày tạo (date)
                            rs.getString("status")        // Trạng thái (status)
                    )).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return usersList;
    }



    public static List<User> getUser() {
        List<User> usersList= new ArrayList<User>();
        try (Handle handle = JDBIConnector.me().open()) {
            String query ="SELECT user_id, name, email, phone, address, pass, roler, `create`, status FROM user";
            Query Ojb = handle.createQuery(query);
            usersList = Ojb.map((rs,ctx)->
                    new User(
                            rs.getInt("user_id"),         // ID người dùng (id)
                            rs.getString("name"),         // Tên (name)
                            rs.getString("address"),      // Địa chỉ (address)
                            rs.getString("email"),        // Email (email)
                            rs.getString("phone"),        // Số điện thoại (phone)
                            rs.getString("pass"),         // Mật khẩu (password)
                            rs.getInt("roler"),           // Vai trò (roler)
                            rs.getTimestamp("create"),    // Ngày tạo (date)
                            rs.getString("status")        // Trạng thái (status)
                    )).list();


        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, trả về một danh sách trống
            return List.of();
        }
        return usersList;
    }

    public static User getUserByID(int userId) {
        User user = new User();
        try (Handle handle = JDBIConnector.me().open()){
            String query ="SELECT user_id, name, email, phone, address, pass, roler, `create`, status FROM user WHERE user_id=?";
            Query Ojb = handle.createQuery(query)
                    .bind(0, userId);
            user = Ojb.map((rs,ctx)->
                    new User(
                            rs.getInt("user_id"),         // ID người dùng (id)
                            rs.getString("name"),         // Tên (name)
                            rs.getString("address"),      // Địa chỉ (address)
                            rs.getString("email"),        // Email (email)
                            rs.getString("phone"),        // Số điện thoại (phone)
                            rs.getString("pass"),         // Mật khẩu (password)
                            rs.getInt("roler"),           // Vai trò (roler)
                            rs.getTimestamp("create"),    // Ngày tạo (date)
                            rs.getString("status")
                    )).findOne().orElse(null);
        }catch (Exception e){

        }
        return user;
    }



//    public static String getName(String id){
//        String result="";
//        try (Handle handle = JDBIConnector.me().open()){
//            String query ="SELECT `name` FROM customers WHERE makh=?";
//            result = handle.createQuery(query)
//                    .bind(0, id)
//                    .mapTo(String.class)
//                    .findOne()
//                    .orElse(null);
//        }
//        return result;
//    }

    public static User getUserPhone(String phone){
        User user = new User();
        try (Handle handle = JDBIConnector.me().open()){
            String query ="SELECT user_id, name, email, phone, address, pass, roler, `create`, status FROM user WHERE phone=?";
            Query Ojb = handle.createQuery(query)
                    .bind(0, phone);
            user = Ojb.map((rs,ctx)->
                    new User(
                            rs.getInt("user_id"),         // ID người dùng (id)
                            rs.getString("name"),         // Tên (name)
                            rs.getString("address"),      // Địa chỉ (address)
                            rs.getString("email"),        // Email (email)
                            rs.getString("phone"),        // Số điện thoại (phone)
                            rs.getString("pass"),         // Mật khẩu (password)
                            rs.getInt("roler"),           // Vai trò (roler)
                            rs.getTimestamp("create"),    // Ngày tạo (date)
                            rs.getString("status")
                    )).findOne().orElse(null);
        }catch (Exception e){

        }
        return user;
    }

//    public static User getUserName(String name){
//        User user = new User();
//        try (Handle handle = JDBIConnector.me().open()){
//            String query ="SELECT makh, `name`, address, email, phone, username, `password`, `level`, `create` FROM customers WHERE username=?";
//            Query Ojb = handle.createQuery(query)
//                    .bind(0, name);
//            user = Ojb.map((rs,ctx)->
//                    new User(
//                            rs.getString("makh"),
//                            rs.getString("name"),
//                            rs.getString("address"),
//                            rs.getString("email"),
//                            rs.getString("phone"),
//                            rs.getString("username"),
//                            rs.getString("password"),
//                            rs.getInt("level"),
//                            rs.getTimestamp("create")
//                    )).findOne().orElse(null);
//        }catch (Exception e){
//
//        }
//        return user;
//    }


//    public static void insertUser(String id, String name, String address, String phone, String email, String pass){
//        try (Handle handle=JDBIConnector.me().open()){
//            String query ="INSERT INTO customers(makh, `name`, address, email, phone, username,`password`,`level`,`create`) VALUES (?,?,?,?,?,?,?,2,NOW())";
//            Update update = handle.createUpdate(query)
//                    .bind(0, id)
//                    .bind(1, name)
//                    .bind(2, address)
//                    .bind(3, email)
//                    .bind(4, phone)
//                    .bind(5, name)
//                    .bind(6, pass);
//            update.execute();
//        }
//
//    }

    public static boolean insertUser(int id, String name, String address, String phone, String email, String password, int roler, String status) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "INSERT INTO user (user_id, name, email, phone, address, pass, roler, `create`, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
            Update update = handle.createUpdate(query)
                    .bind(0, id)          // ID người dùng
                    .bind(1, name)        // Tên
                    .bind(2, email)     // Địa chỉ
                    .bind(3, phone)       // Email
                    .bind(4, address)       // Số điện thoại
                    .bind(5, password)    // Mật khẩu
                    .bind(6, roler)       // Vai trò
                    .bind(7, status);     // Trạng thái
            update.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
            // Có thể log lỗi hoặc xử lý thêm nếu cần
        }
        return true;
    }

    public static void updateUser(int id, String name, String email, String phone, String address) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "UPDATE user SET name = ?, email = ?, phone = ?, address = ? WHERE user_id = ?";
            Update update = handle.createUpdate(query)
                    .bind(0, name)
                    .bind(1,email)
                    .bind(2, phone)
                    .bind(3, address)
                    .bind(4, id);
            update.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void updateUserAddress(int id, String address) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "UPDATE user SET  address = ? WHERE user_id = ?";
            Update update = handle.createUpdate(query)
                    .bind(0, address)
                    .bind(1, id);
            update.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static boolean updatePassword(String email, String newPassword) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "UPDATE user SET pass = ? WHERE email = ?";
            Update update = handle.createUpdate(query)
                    .bind(0, newPassword)  // Mật khẩu mới
                    .bind(1, email);       // Email người dùng
            int rowsUpdated = update.execute();

            // Kiểm tra nếu có bản ghi được cập nhật
            if (rowsUpdated > 0) {
                return true;  // Cập nhật thành công
            } else {
                return false; // Không tìm thấy người dùng với email này
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;  // Lỗi khi cập nhật
        }
    }


    public static void main(String[] args) {
        List<User> userList = getUserByLevel(2);
        for (User u : userList) {
            System.out.println(u.toString());
        }
    }
}
