package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Cart;
import vn.edu.hcmuaf.model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/Cart")
public class newCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session hiện tại
        HttpSession session = req.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        // Nếu giỏ hàng chưa tồn tại, tạo mới
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Cập nhật giỏ hàng vào session
        session.setAttribute("cart", cart);
//
//        // Chuyển hướng về trang giỏ hàng
        req.getRequestDispatcher("./cart.jsp").forward(req,resp);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
