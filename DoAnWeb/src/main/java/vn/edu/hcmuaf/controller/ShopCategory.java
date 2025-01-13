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


@WebServlet(name = "ShopCategory", value = "/ShopCategory")
public class ShopCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("categoryId");
        List<Products> products = ProductsDao.getProductByNumDiretory(Integer.parseInt(id));
        req.setAttribute("shop", products);
        req.getRequestDispatcher("/shop.jsp").forward(req,resp);
    }
}