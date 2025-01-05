package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.InventoryDao;
import vn.edu.hcmuaf.dao.ProductCategoryDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.model.Products;
import vn.edu.hcmuaf.uniti.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveProduct", value = "/admin/RemoveProduct")
public class RemoveProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idPr");

        if (id!=null){
            Products products = ProductsDao.getProduct(Integer.parseInt(id));
            FileUtil.deleteImage(products.getImage());

            ProductsDao.removeProduct(Integer.parseInt(id));
            ProductCategoryDao.removeForProduct(Integer.parseInt(id));
            InventoryDao.removeProduct(Integer.parseInt(id));
        }

        req.getRequestDispatcher("/admin/ManagerProduct.jsp").forward(req,resp);
    }
}
