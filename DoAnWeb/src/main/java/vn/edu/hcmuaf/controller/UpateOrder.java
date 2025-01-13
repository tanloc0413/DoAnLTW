package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.OdersDao;
import vn.edu.hcmuaf.dao.StatusDao;
import vn.edu.hcmuaf.model.Oders;
import vn.edu.hcmuaf.model.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "UpdateStatus", value = "/admin/UpdateStatus")
public class UpateOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String statusId = req.getParameter("select");
        System.out.println(statusId);

        OdersDao.updateOder( statusId, Integer.parseInt(id));

        req.getRequestDispatcher("/admin/Order.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
