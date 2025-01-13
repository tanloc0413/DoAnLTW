package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.model.User;
import vn.edu.hcmuaf.uniti.PasswordUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "register", value = "/register")
public class Register extends HttpServlet {
    Random random = new Random();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin từ request
        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String pass = req.getParameter("pass");
        String confirmPass = req.getParameter("pass1");


        // Kiểm tra dữ liệu đầu vào
        if (name == null || name.isEmpty() ||
                email == null || email.isEmpty() ||
                phone == null || phone.isEmpty() ||
                pass == null || pass.isEmpty() ||
                confirmPass == null || confirmPass.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            req.setAttribute("err","Vui lòng điền đầy đủ thông tin.");
            req.getRequestDispatcher("/sign_up.jsp").forward(req,resp);
        }

        if (!pass.equals(confirmPass)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            req.setAttribute("err","Mật khẩu xác nhận không khớp.");
            req.getRequestDispatcher("/sign_up.jsp").forward(req,resp);
        }

        // Danh sách người dùng từ cơ sở dữ liệu
        List<User> userList = UserDao.getUser();
        int uniqueId = 0;
        boolean flag = false;

        while (!flag){
            uniqueId = random.nextInt(900000) + 100000;
            flag = true;
            for (User user : userList){
                if (user.getId() == uniqueId){
                    flag = false;
                    break;
                }
            }
        }


        // Mã hóa mật khẩu
        String hashedPassword = PasswordUtils.encodePassword(pass);

        // Lưu người dùng mới vào cơ sở dữ liệu
        boolean isInserted = UserDao.insertUser(uniqueId, name,"",phone, email, hashedPassword, 2, "1");

        if (isInserted) {
            resp.getWriter().write("Đăng ký thành công!");
            req.getRequestDispatcher("./Login.jsp").forward(req, resp);
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            req.setAttribute("err","Đã xảy ra lỗi khi đăng ký. Vui lòng thử lại.");
            req.getRequestDispatcher("/sign_up.jsp").forward(req,resp);
        }



    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
