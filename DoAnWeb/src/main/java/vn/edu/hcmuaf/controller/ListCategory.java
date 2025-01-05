package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.CategoriesDao;
import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.model.Categories;
import vn.edu.hcmuaf.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListCategory", value = "/admin/ListCategory")
public class ListCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Categories> categories = CategoriesDao.getDirectorysAdmin();
        req.setAttribute("categorys", categories);
        req.getRequestDispatcher("/admin/product-type.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
