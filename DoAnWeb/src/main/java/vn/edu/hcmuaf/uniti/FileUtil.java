package vn.edu.hcmuaf.uniti;

import java.io.File;
import java.io.IOException;


public class FileUtil {

    public static boolean deleteImage(String filePath) {
        File file = new File(filePath);

        // Kiểm tra nếu file tồn tại
        if (file.exists()) {
            // Xóa file và trả về kết quả
            return file.delete();
        } else {
            System.out.println("File không tồn tại: " + filePath);
            return false;
        }
    }

    public static Boolean checkDir(String filePath) {
        File directory = new File(filePath);
        if (directory.exists() && directory.isDirectory()) {
            return true;
        } else {
            // Tạo thư mục nếu không tồn tại
            boolean created = directory.mkdirs();  // sử dụng mkdirs() để tạo thư mục và tất cả thư mục con (nếu có)
            if (created) {
                return true;
            } else {
                return false;
            }
        }
    }
}
