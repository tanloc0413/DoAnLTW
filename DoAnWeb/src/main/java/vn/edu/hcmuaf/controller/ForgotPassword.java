package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.OtpCode;
import vn.edu.hcmuaf.model.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Random;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        // Kiểm tra nếu email không rỗng
        if (email == null || email.isEmpty()) {
            req.setAttribute("errEmail","Email is empty");
            req.getRequestDispatcher("./forgot_password.jsp").forward(req, resp);

        }
        HttpSession session = req.getSession();
        session.setAttribute("email",email);
        int code = new Random().nextInt(1000000);
        LocalDateTime expires = LocalDateTime.now().plusMinutes(5); // OTP có hiệu lực 5 phút


        boolean boo = OtpCode.insertOtp(email, code, 1, expires);

        if (boo){
            SendMail.sendMail(email,"Quên Mật Khẩu gmail", "Mã OTP của bạn là: " +code);
            req.getRequestDispatcher("./accuracy.jsp").forward(req, resp);
        }else {
            req.setAttribute("errEmail","Email is empty");
            req.getRequestDispatcher("./forgot_password.jsp").forward(req, resp);
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
