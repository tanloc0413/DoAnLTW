package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.OtpCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "VerifyOTP", value = "/VeriyOTP")
public class VerifyOTP extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        String code = req.getParameter("verify");
        if (code == null) {
            req.setAttribute("errCode","OTP is empty");
            req.getRequestDispatcher("./accuracy.jsp").forward(req, resp);
        }

        // Kiểm tra tính hợp lệ của OTP
        boolean isValid = OtpCode.isOtpValid(email, Integer.parseInt(code));

        if (isValid) {
            OtpCode.markOtpAsUsed(Integer.parseInt(code));
            // OTP hợp lệ, có thể tiếp tục các bước khác như cập nhật mật khẩu hoặc thông báo thành công
            req.getRequestDispatcher("./accuracy_sign.jsp").forward(req, resp);
        } else {
            // OTP không hợp lệ hoặc đã hết hạn
            req.setAttribute("errCode", "Invalid OTP or OTP has expired");
            req.getRequestDispatcher("./accuracy.jsp").forward(req, resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
