package vn.edu.hcmuaf.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;


@WebServlet(name = "Language", value = "/Language")
public class Language extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String lang = req.getParameter("lang");
        System.out.println(lang);

        if (lang == null || lang.isEmpty()) {
            lang = "vi"; // Mặc định là Tiếng Viet
        }
        Locale locale = new Locale(lang);
        session.setAttribute("lang", locale);
        System.out.println(locale);

        // Chuyển hướng về trang trước (hoặc trang chủ)
        String referer = req.getHeader("Referer");
        if (referer != null) {
            resp.sendRedirect(referer); // Quay về trang trước
        } else {
            resp.sendRedirect("index.jsp"); // Quay về trang chủ nếu không có trang trước
        }
    }

}
