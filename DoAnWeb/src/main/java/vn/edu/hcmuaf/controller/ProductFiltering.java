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

@WebServlet(name="ProductFiltering", value="/admin/ProductFiltering")
public class ProductFiltering extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("selectm");

            List<Products> productsList = ProductsDao.getProductAdmin();

            if (name != "all"){
                productsList = ProductsDao.getProductByDiretory(Integer.parseInt(name));
            }

            List<Categories> categories = CategoriesDao.getDirectorysAdmin();
            req.setAttribute("categories", categories);
            req.setAttribute("productsDaoList", productsList);
            req.setAttribute("catego", CategoriesDao.getName(Integer.parseInt(name)));
            req.getRequestDispatcher("/admin/ManagerProduct.jsp").forward(req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }

    }


}
