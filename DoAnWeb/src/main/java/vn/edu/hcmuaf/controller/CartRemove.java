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

@WebServlet(name = "CartRemove", value = "/CartRemove")
public class CartRemove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session hiện tại
        HttpSession session = req.getSession();
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        // Lấy thông tin sản phẩm cần xóa từ request
        int productId = Integer.parseInt(req.getParameter("Id"));
        System.out.println(productId);
        // Nếu giỏ hàng không tồn tại, chuyển hướng về trang giỏ hàng
        if (cart == null) {
            req.getRequestDispatcher("./Order.jsp").forward(req, resp);
            return;
        }

        // Tìm và xóa một mục duy nhất khỏi giỏ hàng
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProductId() == productId) {
                cart.remove(i);
                break; // Thoát vòng lặp sau khi xóa một mục
            }
        }

        // Cập nhật giỏ hàng vào session
        session.setAttribute("cart", cart);

        // Chuyển hướng về trang giỏ hàng
        req.getRequestDispatcher("./Order.jsp").forward(req, resp);
    }

}
