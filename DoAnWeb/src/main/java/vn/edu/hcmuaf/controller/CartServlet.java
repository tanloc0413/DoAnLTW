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

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session hiện tại
        HttpSession session = req.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        // Lấy thông tin sản phẩm từ request
        int productId = Integer.parseInt(req.getParameter("productId"));
        Products products = ProductsDao.getProduct(productId);
        int quantity = Integer.parseInt(req.getParameter("quantity"));


        // Tạo đối tượng CartItem
        Cart newItem = new Cart(productId, products.getName(), products.getImage(), products.getPrice(), quantity);



        // Nếu giỏ hàng chưa tồn tại, tạo mới
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
        boolean itemExists = false;
        for (Cart item : cart) {
            if (item.getProductId() == productId) {
                // Cập nhật số lượng sản phẩm
                item.setQuantity(quantity);
                itemExists = true;
                break;
            }
        }

        // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
        if (!itemExists) {
            cart.add(newItem);
        }
        double totalAmount = 0.0;
        for (Cart item : cart) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

        // Cập nhật giỏ hàng vào session
        session.setAttribute("cart", cart);
        session.setAttribute("totalAmount", totalAmount);
//
//        // Chuyển hướng về trang giỏ hàng
        req.getRequestDispatcher("./Order.jsp").forward(req,resp);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
