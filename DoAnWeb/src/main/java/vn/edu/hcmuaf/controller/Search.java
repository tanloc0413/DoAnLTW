package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.ProductCategoryDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Products;
import vn.edu.hcmuaf.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("search");



        List<Products> products = ProductsDao.getProductSearch(text);
        req.setAttribute("shop", products);
        req.getRequestDispatcher("/shop.jsp").forward(req,resp);


    }
}
