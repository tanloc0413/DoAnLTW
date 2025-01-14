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

    public static void main(String[] args) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // Mã hóa mật khẩu
        String rawPassword = "mySecretPassword";
        String encryptedPassword = passwordEncoder.encode(rawPassword);

        System.out.println("Mật khẩu đã mã hóa: " + encryptedPassword);

        // Kiểm tra mật khẩu
        boolean matches = passwordEncoder.matches("mySecretPassword", encryptedPassword);
        System.out.println("Mật khẩu khớp: " + matches);
    }
}
