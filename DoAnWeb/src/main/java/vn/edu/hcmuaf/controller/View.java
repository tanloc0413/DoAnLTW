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

@WebServlet(name = "View", value = "/View")
public class View extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");
        if (user!=null){
            String id = req.getParameter("maview");

            Products products = ProductsDao.getProduct(Integer.parseInt(id));
            int idCa = ProductCategoryDao.getIDCategory(Integer.parseInt(id));
            List<Products> listP = ProductsDao.getNewProduct();
            List<Products> listCate = ProductsDao.getProductByNumDiretory(idCa);

            req.setAttribute("de", products);
            req.setAttribute("listP", listP);
            req.setAttribute("listCate", listCate);
            req.getRequestDispatcher("/single-product.jsp").forward(req,resp);
        }else {
            req.getRequestDispatcher("./Login.jsp").forward(req,resp);
        }

    }
}
