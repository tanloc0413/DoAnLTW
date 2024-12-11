package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.CategoriesDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Categories;
import vn.edu.hcmuaf.model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListManagerProduct", value = "/admin/ListManagerProduct")
public class ListManagerProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Categories> categories = CategoriesDao.getDirectorysAdmin();
        List<Products> productsDaoList = ProductsDao.getProductAdmin();


        req.setAttribute("categories", categories);

        req.setAttribute("productsDaoList", productsDaoList);
        req.setAttribute("catego", "all");
        req.getRequestDispatcher("/admin/ManagerProduct.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
