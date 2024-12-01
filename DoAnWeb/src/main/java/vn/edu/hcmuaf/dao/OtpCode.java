package vn.edu.hcmuaf.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.db.JDBIConnector;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class OtpCode {

    // Phương thức chèn mã OTP mới vào bảng OTP
    public static boolean insertOtp(String email, int code, int status, LocalDateTime expires) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "INSERT INTO otp_code (email, code,  expires, `create`,  status) " +
                    "VALUES (?, ?, ?, NOW(), ?)";
            Update update = handle.createUpdate(query)
                    .bind(0, email)      // Email người dùng
                    .bind(1, code)       // Mã OTP
                    .bind(2, expires)    // Thời gian hết hạn
                    .bind(3, status);    // Trạng thái OTP (VALID, USED, EXPIRED)
            update.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
            // Có thể log lỗi hoặc xử lý thêm nếu cần
        }
        return true;
    }

    // Phương thức xác minh mã OTP
    public static boolean isOtpValid(String email, int code) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "SELECT  expires, status FROM otp_code WHERE email = ? AND code = ? AND status = 1";
            var result = handle.createQuery(query)
                    .bind(0, email)    // Email người dùng
                    .bind(1, code)     // Mã OTP
                    .mapToMap()
                    .list();
            if (result.isEmpty()) {
                return false; // Không tìm thấy OTP hợp lệ
            } else {
                // Lấy giá trị expires và chuyển đổi LocalDateTime thành String
                LocalDateTime expires = (LocalDateTime) result.get(0).get("expires");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String expiresFormatted = expires.format(formatter);

                // Kiểm tra xem mã OTP có hết hạn hay không
                if (isExpired(expiresFormatted)) {
                    // Cập nhật trạng thái nếu OTP đã hết hạn
                    markOtpAsExpired((Integer) result.get(0).get("email"));
                    return false;
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức đánh dấu OTP là đã sử dụng
    public static void markOtpAsUsed(int otp) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "UPDATE otp_code SET status = 0 WHERE code = ?";
            handle.createUpdate(query)
                    .bind(0, otp)
                    .execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phương thức đánh dấu OTP là đã hết hạn
    public static void markOtpAsExpired(int otpId) {
        try (Handle handle = JDBIConnector.me().open()) {
            String query = "UPDATE otp SET status = 'EXPIRED' WHERE otp_id = ?";
            handle.createUpdate(query)
                    .bind(0, otpId)
                    .execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Phương thức kiểm tra xem OTP có hết hạn không
    private static boolean isExpired(String expires) {
        // Cần phải thêm logic so sánh thời gian hiện tại với thời gian hết hạn của OTP
        return false; // Trả về true nếu đã hết hạn, false nếu chưa hết hạn
    }
}
