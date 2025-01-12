package vn.edu.hcmuaf.controller;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import vn.edu.hcmuaf.dao.OdersDao;
import vn.edu.hcmuaf.model.Oders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "OderAdmin", value = "/admin/OderAdmin")
public class OrderAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Oders> odersList = OdersDao.getOdersAdmin();
        List<Oders> odersListDH05 = OdersDao.getOdersAdminStatus("DH05");
        List<Oders> odersListDH08 = OdersDao.getOdersAdminStatus("DH08");

        req.setAttribute("odersList", odersList);
        req.setAttribute("odersListDH05", odersListDH05);
        req.setAttribute("odersListDH08", odersListDH08);
        req.getRequestDispatcher("/admin/Order.jsp").forward(req, resp);
    }
}
