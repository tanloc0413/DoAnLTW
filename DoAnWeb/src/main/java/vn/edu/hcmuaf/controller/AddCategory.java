package vn.edu.hcmuaf.controller;


import vn.edu.hcmuaf.dao.CategoriesDao;
import vn.edu.hcmuaf.dao.ProductCategoryDao;
import vn.edu.hcmuaf.model.ProductCategory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "AddCategory", value = "/admin/AddCategory")
public class AddCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("madm");
        String ten = req.getParameter("ten");
        String status = req.getParameter("select");

        CategoriesDao.insertCategoryNew(id, ten, status);
        req.getRequestDispatcher("/admin/product-type.jsp").forward(req,resp);
    }
}
