package vn.edu.hcmuaf.uniti;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtils {
    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    // Hàm mã hóa mật khẩu
    public static String encodePassword(String rawPassword) {
        return encoder.encode(rawPassword);
    }

    // Hàm kiểm tra mật khẩu (dùng cho đăng nhập)
    public static boolean matchPassword(String rawPassword, String encodedPassword) {
        return encoder.matches(rawPassword, encodedPassword);
    }


}
