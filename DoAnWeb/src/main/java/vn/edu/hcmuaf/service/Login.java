package vn.edu.hcmuaf.service;

import vn.edu.hcmuaf.model.User;
import vn.edu.hcmuaf.uniti.PasswordUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin từ request
        String name = req.getParameter("username");
        String pass = req.getParameter("pass");

        // Kiểm tra thông tin đăng nhập
        User user = UserAdminService.getInstance().checkLogin(name, pass);

        if (user != null) {
            // So sánh mật khẩu đã nhập với mật khẩu đã mã hóa trong cơ sở dữ liệu
            boolean isPasswordMatch = PasswordUtils.matchPassword(pass, user.getPassword());

            if (isPasswordMatch) {
                // Xác định quyền truy cập
                HttpSession session = req.getSession();
                session.setAttribute("auth", user);

                if (user.getLevel() == 2) {
                    // Người dùng thường
                    resp.sendRedirect("index.jsp");
                } else {
                    // Quản trị viên
                    resp.sendRedirect("admin/index.jsp");
                }
            } else {
                // Mật khẩu không đúng
                req.setAttribute("err", "Bạn nhập sai tên đăng nhập hoặc mật khẩu!");
                req.getRequestDispatcher("Login.jsp").forward(req, resp);
            }
        } else {
            // Người dùng không tồn tại
            req.setAttribute("err", "Tên đăng nhập không tồn tại!");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
