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
}
