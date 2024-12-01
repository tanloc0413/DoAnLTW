package vn.edu.hcmuaf.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "logOut", value = "/logOut")
public class logOut extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session hiện tại (nếu có)
        HttpSession session = req.getSession(false);  // false không tạo session mới nếu chưa có

        if (session != null) {
            // Xóa thông tin người dùng trong session
            session.invalidate();  // Hủy session hiện tại
        }

        // Chuyển hướng người dùng về trang đăng nhập
        resp.sendRedirect("Login.jsp");  // Chuyển hướng về trang đăng nhập
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
