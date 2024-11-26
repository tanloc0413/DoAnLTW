package vn.edu.hcmuaf.service;

import vn.edu.hcmuaf.dao.OdersDao;
import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.model.Oders;
import vn.edu.hcmuaf.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    //    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String name = req.getParameter("username");
//            String email = req.getParameter("email");
//            String phone= req.getParameter("phone");
//            String pass = req.getParameter("pass");
//            String com = req.getParameter("pass1");
//        List<User> userList = UserDao.getUser();
//        String id = Oders.generateRandomNumbers();
//        for (User i: userList){
//            if (id.equals(i.getId())){
//                id =  Oders.generateRandomNumbers();
//            }
//        }
//        boolean b = false;
//        String err = "";
//        for (User u: userList){
//            if (name.equals(u.getPhone())){
//                b = true;
//              err = "Số điện thoại đã tồn tại!";
//              break;
//            }else if (email.equals(u.getEmail())){
//                b = true;
//                err = "Email đã tồn tại!";
//                break;
//            }
//        }
//        if (pass != null && com != null & pass.equals(com)){
//            if (b){
//                req.setAttribute("err",err);
//                req.getRequestDispatcher("/sign_up.jsp").forward(req,resp);
//            }else {
//                UserDao.insertUser(id, name, " ",phone,email,pass );
//                req.getRequestDispatcher("notification.html").forward(req,resp);
//            }
//        }else {
//            req.setAttribute("err","Mật khẩu không trùng khớp");
//            req.getRequestDispatcher("/sign_up.jsp").forward(req,resp);
//        }
//
//
//    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin từ request
        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String pass = req.getParameter("pass");
        String confirmPass = req.getParameter("pass1");

        // Danh sách người dùng từ cơ sở dữ liệu
        List<User> userList = UserDao.getUser();

        // Sinh ID ngẫu nhiên cho người dùng mới và đảm bảo không trùng lặp
        int id = Integer.parseInt(Oders.generateRandomNumbers());  // Giả sử ID là chuỗi số ngẫu nhiên

    // Kiểm tra sự trùng lặp trong danh sách người dùng
        boolean isDuplicate = true;
        while (isDuplicate) {
            isDuplicate = false;  // Mặc định là không trùng lặp
            for (User user : userList) {
                if (id == user.getId()) {  // Nếu ID đã tồn tại, sinh lại ID
                    id = Integer.parseInt(Oders.generateRandomNumbers());  // Sinh ID mới
                    isDuplicate = true;  // Đánh dấu là trùng lặp và tiếp tục kiểm tra
                    break;  // Thoát khỏi vòng lặp nếu tìm thấy trùng lặp
                }
            }
        }

        // Kiểm tra trùng lặp thông tin
        String errorMessage = null;

        if (userList.stream().anyMatch(user -> phone.equals(user.getPhone()))) {
            errorMessage = "Số điện thoại đã tồn tại!";
        } else if (userList.stream().anyMatch(user -> email.equals(user.getEmail()))) {
            errorMessage = "Email đã tồn tại!";
        } else if (pass == null || confirmPass == null || !pass.equals(confirmPass)) {
            errorMessage = "Mật khẩu không trùng khớp!";
        }

        // Xử lý kết quả kiểm tra
        if (errorMessage != null) {
            // Có lỗi -> trả lại form đăng ký với thông báo lỗi
            req.setAttribute("err", errorMessage);
            req.getRequestDispatcher("/sign_up.jsp").forward(req, resp);
        } else {
            // Không có lỗi -> thêm người dùng vào cơ sở dữ liệu
            UserDao.insertUser(id, name, "", phone, email, pass, 2, "1");
            // Điều hướng tới thông báo đăng ký thành công
            req.getRequestDispatcher("/notification.html").forward(req, resp);
        }
    }
}
