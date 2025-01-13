package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Products;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Shop", value = "/Shop")
public class Shop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<Products> products = ProductsDao.getProductAdmin();
            req.setAttribute("shop", products);
            req.getRequestDispatcher("/shop.jsp").forward(req,resp);


    }
}
