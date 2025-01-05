package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.CategoriesDao;
import vn.edu.hcmuaf.dao.ProductCategoryDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveCategory", value = "/admin/RemoveCategory")
public class RemoveCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("ma");

        if (id !=null && ProductCategoryDao.getNum(Integer.parseInt(id))==0){
           CategoriesDao.removeCategory(Integer.parseInt(id));
        }
        req.getRequestDispatcher("/admin/product-type.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
