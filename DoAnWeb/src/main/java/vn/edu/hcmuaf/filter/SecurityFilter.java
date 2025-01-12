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

        String uri = rq.getRequestURI();
        User user = (User) rq.getSession().getAttribute("user");
//		String error = "";
        int error = 0;
        if (user == null) {
            rq.getRequestDispatcher("Login.jsp").forward(rq, resp);
//			error = resp.encodeURL("Vui lòng đăng nhập");
            error = 1; //Vui long dang nhap khi vao url admin
        } else if (user.getRoler() != Role.ADMIN ) { //&& uri.contains("/amin/")
//			error = resp.encodeURL("Vui lòng đăng nhập với vai trò admin");
            error = 2;//Dang nhap voi tai khoan vai tro admin
            rq.getRequestDispatcher("Login.jsp").forward(rq, resp);
        }

        if (error != 0) {//!error.isEmpty()
            rq.setAttribute("securi", uri);
            resp.sendRedirect("/Project_CK_LTWEB/login?error=" + error);
        } else {
            chain.doFilter(rq, resp);
        }

    }

}
