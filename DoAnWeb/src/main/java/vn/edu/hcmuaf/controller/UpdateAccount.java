package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "updateAccount", value = "/admin/updateAccount")
public class UpdateAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session (admin sẽ là người đăng nhập)
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("currentUser") != null) {
            User currentUser = (User) session.getAttribute("currentUser");

            // Kiểm tra xem người dùng có phải là admin không
            if (currentUser.getRoler() == 0) {
                // Lấy thông tin từ form
                int id = Integer.parseInt(req.getParameter("id"));

                String name = req.getParameter("name");
                System.out.println(name);
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String address = req.getParameter("address");
                String role = req.getParameter("role");



                // Cập nhật thông tin người dùng
                User user = UserDao.getUserByID(id);

                user.setName(name);
                user.setEmail(email);
                user.setPhone(phone);
                user.setAddress(address);
//                if (role.equals("admin")) {
//                    user.setRoler(1);
//                } else if (role.equals("user")) {
//                    user.setRoler(2);
//                }else {
//                    user.setRoler(0);
//                }

                UserDao.updateUser(id, name, email, phone, address); // Cập nhật thông tin vào cơ sở dữ liệu

                req.setAttribute("info","Thanh cong!" );
                // Chuyển hướng về trang tài khoản admin
                resp.sendRedirect("account-edit.jsp?id=" + id); // Giả sử trang chi tiết tài khoản admin
            } else {
                // Nếu không phải admin, không cho phép cập nhật
                resp.sendRedirect("access-denied.jsp"); // Trang thông báo lỗi khi không phải admin
            }
        } else {
            // Nếu không có session người dùng, chuyển hướng về trang đăng nhập
            resp.sendRedirect("Login.jsp");
        }
    }

}
