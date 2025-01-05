package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "NewPassword", value = "/NewPassword")
public class NewPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = session.getAttribute("email").toString();
        String newPassword = req.getParameter("newpass");
        String rePass = req.getParameter("repass");

        if (!newPassword.equals(rePass)) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            req.setAttribute("errnew","Mật khẩu xác nhận không khớp.");
            req.getRequestDispatcher("/notification.html").forward(req,resp);
        }

        boolean bo = UserDao.updatePassword(email, newPassword);
        if (bo) {
            req.getRequestDispatcher("/accuracy_sign.jsp").forward(req,resp);
            session.invalidate();
        }else {
            req.setAttribute("errnew","Lỗi, không thể cập nhật");
            req.getRequestDispatcher("/notification.html").forward(req,resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
