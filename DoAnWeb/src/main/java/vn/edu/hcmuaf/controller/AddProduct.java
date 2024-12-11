package vn.edu.hcmuaf.controller;

import vn.edu.hcmuaf.dao.*;
import vn.edu.hcmuaf.db.ConfigProperties;
import vn.edu.hcmuaf.uniti.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


@WebServlet(name = "AddProduct", value = "/admin/AddProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("masp"));
        String ten= req.getParameter("ten");
        double price  = Double.parseDouble(req.getParameter("price"));
        String hangsx = req.getParameter("hang");
        int number = Integer.parseInt(req.getParameter("number"));
        String mota = req.getParameter("text");
        String statusID = req.getParameter("select");
        int category = Integer.parseInt(req.getParameter("select2"));
        String nameCategory = CategoriesDao.getName(category);

        Part filePart = req.getPart("url");
        String fileName = getFileName(filePart); // Lấy tên file từ header
        String uploadfile =  ConfigProperties.dir + nameCategory + "/" + fileName;
        if(!FileUtil.checkDir(ConfigProperties.dir + nameCategory)){
            return;
        }

        String relativePath = "admin/img/product/" + nameCategory +"/" + fileName; // Đường dẫn tương đối để lưu vào DB
        try{
            FileOutputStream fos = new FileOutputStream(uploadfile);
            InputStream is = filePart.getInputStream();

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            fos.close();

        }catch (Exception e){
            e.printStackTrace();
            resp.getWriter().write("File upload failed");
            return;
        }


//        String image = FileUploadUtil.uploadImage(fileName, "src/main/webapp/img");
        ProductsDao.insertProductNew(id, ten, hangsx, price, mota, statusID, relativePath);
        ProductCategoryDao.addProductCategory(category, id);

        InventoryDao.insertInventory( id, number);

        req.getRequestDispatcher("./ListManagerProduct").forward(req,resp);


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    // Phương thức trích xuất tên file từ Content-Disposition header
    private String getFileName(Part part) {
        for (String cd : part.getHeader("Content-Disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf("=") + 2, cd.length() - 1);
            }
        }
        return null; // Nếu không tìm thấy, trả về null
    }
}
