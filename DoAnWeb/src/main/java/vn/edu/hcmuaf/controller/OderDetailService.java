package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.OderDetailDao;
import vn.edu.hcmuaf.dao.OdersDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OderDetail", value = "/admin/OderDetail")
public class OderDetailService extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Oders oders = OdersDao.getOrderById(Integer.parseInt(id));
        List<OderItems> oderItemsList = OderDetailDao.getOder(Integer.parseInt(id));
        User user = UserDao.getUserByID(oders.getUserId());

        List<OrderProduct> orderProducts = new ArrayList<OrderProduct>();
        for (OderItems oderItems : oderItemsList) {
            Products products = ProductsDao.getProduct(oderItems.getProductId());
            OrderProduct orderProduct = new OrderProduct(products, oderItems.getQuantity());
            orderProducts.add(orderProduct);
        }

        req.setAttribute("oderDetail", oders);
        req.setAttribute("oderItemsList", orderProducts);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/admin/product-Order.jsp").forward(req,resp);
    }
}
