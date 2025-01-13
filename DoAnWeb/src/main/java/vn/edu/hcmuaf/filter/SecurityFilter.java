package vn.edu.hcmuaf.filter;

import vn.edu.hcmuaf.model.Role;
import vn.edu.hcmuaf.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/admin/*")
public class SecurityFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        User user = (User) rq.getSession().getAttribute("currentUser");

        // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
        if (user == null) {
            resp.sendRedirect("/Login.jsp");
            return;
        }

        // Nếu người dùng không phải là admin, chuyển hướng đến trang đăng nhập
        if (user.getRoler() != Role.ADMIN && user.getRoler() != Role.ADMIN1) {
            resp.sendRedirect("/Login.jsp");
            return;
        }

        // Nếu người dùng là admin, cho phép truy cập và tiếp tục với chuỗi lọc
        chain.doFilter(rq, resp);
    }

}

