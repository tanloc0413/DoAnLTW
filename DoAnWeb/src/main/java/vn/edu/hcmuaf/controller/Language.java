package vn.edu.hcmuaf.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        String lang = req.getParameter("lang");
        if (lang == null) {
            lang = "vi"; // Mặc định là Tiếng Viet
        }
        Locale locale = new Locale(lang);
        req.getSession().setAttribute("lang", locale);

        // Chuyển hướng lại về trang chủ (hoặc trang bất kỳ)
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}
