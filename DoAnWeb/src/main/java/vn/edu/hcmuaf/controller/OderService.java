package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.OderDetailDao;
import vn.edu.hcmuaf.dao.OdersDao;
import vn.edu.hcmuaf.dao.ProductsDao;
import vn.edu.hcmuaf.dao.UserDao;

import vn.edu.hcmuaf.model.Cart;
import vn.edu.hcmuaf.model.OderItems;
import vn.edu.hcmuaf.model.Oders;
import vn.edu.hcmuaf.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "Oder", value = "/Oder")
public class OderService extends HttpServlet {
    Random random = new Random();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String address = req.getParameter("billing_address");
            if (address == null) {
                req.setAttribute("err","Vui lòng điền đầy đủ thông tin");
                req.getRequestDispatcher("/checkout.jsp").forward(req,resp);

            }else{
                List<Oders> odersList = OdersDao.getOdersAdmin();
                int uniqueId = 0;
                boolean flag = false;

                while (!flag){
                    uniqueId = random.nextInt(900000) + 100000;
                    flag = true;
                    for (Oders oders : odersList ){
                        if (oders.getId() == uniqueId){
                            flag = false;
                            break;
                        }
                    }
                }

                // Lấy session và đối tượng user, cart từ session
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("currentUser");
                List<Cart> cart = (List<Cart>) session.getAttribute("cart");

                double total = 0.0;
                for (Cart item : cart) {
                    total += item.getPrice() * item.getQuantity();
                }

                List<OderItems> oderItemsList = new ArrayList<>();
                for (Cart item : cart) {
                    OderItems oderItems = new OderItems(uniqueId, item.getProductId(), item.getQuantity(), item.getPrice()*item.getQuantity());
                    oderItemsList.add(oderItems);
                }

                UserDao.updateUserAddress(user.getId(), address);


                // Chèn đơn hàng vào cơ sở dữ liệu
                OdersDao.insertOders(uniqueId, user.getId(), total, "DH04");
                OderDetailDao.insertBatch(oderItemsList);
                // Chuyển hướng người dùng tới trang thông tin
                req.getRequestDispatcher("/infeo.jsp").forward(req, resp);
                // Reset giỏ hàng
                List<Cart> cartList = new ArrayList<>();
                session.setAttribute("cart", cartList);



                // Giả lập thời gian xử lý (trễ trước khi cập nhật trạng thái đơn hàng)
                Thread.sleep(2000);

                // Cập nhật trạng thái đơn hàng sau khi đã xử lý
                OdersDao.updateOder( "DH05", uniqueId);
            }



        } catch (Exception e) {
            e.printStackTrace();  // Ghi lại thông tin lỗi nếu có
            // Bạn có thể xử lý thêm thông báo lỗi cho người dùng ở đây nếu cần
        }
    }

}
