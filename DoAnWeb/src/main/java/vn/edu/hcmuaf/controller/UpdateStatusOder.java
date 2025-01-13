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

@WebServlet(name = "UpdateStatusOder", value = "/admin/UpdateStatusOder")
public class UpdateStatusOder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("madh");
        Oders dao = OdersDao.getOrderById(Integer.parseInt(id));
//        if (id!=null){
//            String status = req.getParameter("select");
//            OdersDao.updateStatusOder(id, status);
//
//        }
        Status status = StatusDao.getStatusById(dao.getStatus());
        List<Status> statusList = StatusDao.getStatusByOderNew();
        req.setAttribute("order", dao);
        req.setAttribute("dao", status);
        req.setAttribute("statusList", statusList);

        req.getRequestDispatcher("/admin/updateOder.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
